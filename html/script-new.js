/**
 * LXR Radial Menu v2.0 - Modern JavaScript
 * © 2026 iBoss | www.wolves.land
 */

// ═══════════════════════════════════════════════════════════════
// STATE MANAGEMENT
// ═══════════════════════════════════════════════════════════════

const MenuState = {
    isOpen: false,
    currentMenu: 'main',
    menuStack: [],
    currentItems: [],
    config: null,
    settings: {
        theme: 'wolves',
        animationSpeed: 'normal',
        soundEnabled: true,
        blurEnabled: true,
        tooltipsEnabled: true
    }
};

// ═══════════════════════════════════════════════════════════════
// UTILITY FUNCTIONS
// ═══════════════════════════════════════════════════════════════

const Utils = {
    /**
     * Calculate position on circle
     * @param {number} index - Item index
     * @param {number} total - Total items
     * @param {number} radius - Circle radius
     * @returns {Object} x, y coordinates
     */
    getCirclePosition(index, total, radius) {
        const angle = (360 / total) * index - 90; // Start from top
        const radians = (angle * Math.PI) / 180;
        
        return {
            x: Math.cos(radians) * radius,
            y: Math.sin(radians) * radius
        };
    },

    /**
     * Apply theme colors
     * @param {Object} theme - Theme configuration
     */
    applyTheme(theme) {
        const root = document.documentElement;
        root.style.setProperty('--primary-color', theme.primary);
        root.style.setProperty('--secondary-color', theme.secondary);
        root.style.setProperty('--background-color', theme.background);
        root.style.setProperty('--text-color', theme.text);
        root.style.setProperty('--hover-color', theme.hover);
        root.style.setProperty('--accent-color', theme.accent);
    },

    /**
     * Play sound effect
     * @param {string} soundName - Sound event name
     */
    playSound(soundName) {
        if (!MenuState.settings.soundEnabled) return;
        
        fetch(`https://${GetParentResourceName()}/playSound`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ sound: soundName })
        }).catch(() => {});
    },

    /**
     * Send NUI callback
     * @param {string} action - Action name
     * @param {Object} data - Data to send
     */
    sendCallback(action, data = {}) {
        fetch(`https://${GetParentResourceName()}/${action}`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data)
        }).catch(() => {});
    },

    /**
     * Debounce function
     * @param {Function} func - Function to debounce
     * @param {number} wait - Wait time in ms
     * @returns {Function} Debounced function
     */
    debounce(func, wait) {
        let timeout;
        return function(...args) {
            clearTimeout(timeout);
            timeout = setTimeout(() => func.apply(this, args), wait);
        };
    }
};

// ═══════════════════════════════════════════════════════════════
// MENU RENDERING
// ═══════════════════════════════════════════════════════════════

const MenuRenderer = {
    /**
     * Render radial menu items
     * @param {Array} items - Menu items
     */
    renderItems(items) {
        const container = document.getElementById('radial-items');
        container.innerHTML = '';
        
        const radius = parseFloat(getComputedStyle(document.documentElement)
            .getPropertyValue('--menu-radius'));
        
        items.forEach((item, index) => {
            if (!item.enabled) return;
            
            const element = this.createItemElement(item, index, items.length, radius);
            container.appendChild(element);
        });
        
        // Animate items in
        setTimeout(() => {
            document.querySelectorAll('.radial-item').forEach((el, i) => {
                setTimeout(() => {
                    el.style.opacity = '0';
                    el.style.transform = 'scale(0)';
                    setTimeout(() => {
                        el.style.transition = 'all 0.3s ease';
                        el.style.opacity = '1';
                        el.style.transform = 'scale(1)';
                    }, 10);
                }, i * 50);
            });
        }, 10);
    },

    /**
     * Create individual menu item element
     * @param {Object} item - Item configuration
     * @param {number} index - Item index
     * @param {number} total - Total items
     * @param {number} radius - Circle radius
     * @returns {HTMLElement} Item element
     */
    createItemElement(item, index, total, radius) {
        const pos = Utils.getCirclePosition(index, total, radius);
        
        const element = document.createElement('div');
        element.className = 'radial-item';
        element.dataset.itemId = item.id;
        element.style.left = `calc(50% + ${pos.x}px - ${parseFloat(getComputedStyle(document.documentElement).getPropertyValue('--icon-size')) / 2}px)`;
        element.style.top = `calc(50% + ${pos.y}px - ${parseFloat(getComputedStyle(document.documentElement).getPropertyValue('--icon-size')) / 2}px)`;
        
        element.innerHTML = `
            <div class="radial-item-icon">${item.icon}</div>
            <div class="radial-item-label">${item.label}</div>
        `;
        
        // Event listeners
        element.addEventListener('click', () => this.handleItemClick(item));
        element.addEventListener('mouseenter', () => this.handleItemHover(item));
        element.addEventListener('mouseleave', () => this.handleItemLeave());
        
        return element;
    },

    /**
     * Handle item click
     * @param {Object} item - Item configuration
     */
    handleItemClick(item) {
        Utils.playSound('select');
        
        if (item.submenu) {
            MenuController.openSubmenu(item.submenu);
        } else if (item.action) {
            Utils.sendCallback('menuAction', {
                action: item.action,
                itemId: item.id
            });
            
            if (MenuState.config && MenuState.config.closeOnSelect) {
                MenuController.close();
            }
        }
    },

    /**
     * Handle item hover
     * @param {Object} item - Item configuration
     */
    handleItemHover(item) {
        Utils.playSound('hover');
        
        if (MenuState.settings.tooltipsEnabled && item.description) {
            this.showInfoPanel(item);
        }
    },

    /**
     * Handle item leave
     */
    handleItemLeave() {
        this.hideInfoPanel();
    },

    /**
     * Show info panel
     * @param {Object} item - Item configuration
     */
    showInfoPanel(item) {
        const panel = document.getElementById('info-panel');
        document.getElementById('info-title').textContent = item.label;
        document.getElementById('info-description').textContent = item.description || '';
        document.getElementById('info-hotkey').textContent = item.hotkey ? `Hotkey: ${item.hotkey}` : '';
        
        panel.classList.remove('hidden');
    },

    /**
     * Hide info panel
     */
    hideInfoPanel() {
        document.getElementById('info-panel').classList.add('hidden');
    },

    /**
     * Update breadcrumb navigation
     */
    updateBreadcrumb() {
        const breadcrumb = document.getElementById('breadcrumb');
        breadcrumb.innerHTML = '';
        
        const items = ['Main Menu', ...MenuState.menuStack];
        
        items.forEach((item, index) => {
            const span = document.createElement('span');
            span.className = 'breadcrumb-item';
            span.textContent = item;
            
            if (index === items.length - 1) {
                span.classList.add('active');
            } else {
                span.addEventListener('click', () => {
                    // Navigate back
                    const stepsBack = items.length - index - 1;
                    for (let i = 0; i < stepsBack; i++) {
                        MenuController.goBack();
                    }
                });
            }
            
            breadcrumb.appendChild(span);
            
            if (index < items.length - 1) {
                const separator = document.createElement('span');
                separator.className = 'breadcrumb-separator';
                separator.textContent = '›';
                breadcrumb.appendChild(separator);
            }
        });
    }
};

// ═══════════════════════════════════════════════════════════════
// MENU CONTROLLER
// ═══════════════════════════════════════════════════════════════

const MenuController = {
    /**
     * Open menu
     * @param {Object} data - Menu data
     */
    open(data) {
        if (MenuState.isOpen) return;
        
        MenuState.isOpen = true;
        MenuState.config = data.config;
        MenuState.currentItems = data.items;
        
        // Apply theme
        if (data.theme) {
            Utils.applyTheme(data.theme);
        }
        
        // Show menu
        const menu = document.getElementById('radial-menu');
        menu.classList.remove('hidden');
        
        // Apply blur setting
        const overlay = document.getElementById('menu-overlay');
        if (!MenuState.settings.blurEnabled) {
            overlay.style.backdropFilter = 'none';
            overlay.style.webkitBackdropFilter = 'none';
        }
        
        // Render items
        MenuRenderer.renderItems(data.items);
        MenuRenderer.updateBreadcrumb();
        
        // Play sound
        Utils.playSound('open');
        
        // Send opened event
        Utils.sendCallback('menuOpened');
    },

    /**
     * Close menu
     */
    close() {
        if (!MenuState.isOpen) return;
        
        MenuState.isOpen = false;
        MenuState.menuStack = [];
        
        // Hide menu
        const menu = document.getElementById('radial-menu');
        menu.classList.add('hidden');
        
        // Clear items
        document.getElementById('radial-items').innerHTML = '';
        document.getElementById('submenu-items').innerHTML = '';
        MenuRenderer.hideInfoPanel();
        
        // Play sound
        Utils.playSound('close');
        
        // Send closed event
        Utils.sendCallback('menuClosed');
    },

    /**
     * Open submenu
     * @param {string} submenuId - Submenu identifier
     */
    openSubmenu(submenuId) {
        MenuState.menuStack.push(submenuId);
        
        // Request submenu items from Lua
        Utils.sendCallback('requestSubmenu', { submenuId });
    },

    /**
     * Go back to previous menu
     */
    goBack() {
        if (MenuState.menuStack.length === 0) {
            this.close();
            return;
        }
        
        MenuState.menuStack.pop();
        
        if (MenuState.menuStack.length === 0) {
            // Back to main menu
            MenuRenderer.renderItems(MenuState.currentItems);
        } else {
            // Request previous submenu
            Utils.sendCallback('requestSubmenu', {
                submenuId: MenuState.menuStack[MenuState.menuStack.length - 1]
            });
        }
        
        MenuRenderer.updateBreadcrumb();
    }
};

// ═══════════════════════════════════════════════════════════════
// SETTINGS CONTROLLER
// ═══════════════════════════════════════════════════════════════

const SettingsController = {
    /**
     * Open settings panel
     */
    open() {
        document.getElementById('settings-panel').classList.remove('hidden');
        this.loadSettings();
    },

    /**
     * Close settings panel
     */
    close() {
        document.getElementById('settings-panel').classList.add('hidden');
    },

    /**
     * Load current settings
     */
    loadSettings() {
        document.getElementById('theme-select').value = MenuState.settings.theme;
        document.getElementById('animation-select').value = MenuState.settings.animationSpeed;
        document.getElementById('sound-toggle').checked = MenuState.settings.soundEnabled;
        document.getElementById('blur-toggle').checked = MenuState.settings.blurEnabled;
        document.getElementById('tooltip-toggle').checked = MenuState.settings.tooltipsEnabled;
    },

    /**
     * Save settings
     */
    save() {
        MenuState.settings = {
            theme: document.getElementById('theme-select').value,
            animationSpeed: document.getElementById('animation-select').value,
            soundEnabled: document.getElementById('sound-toggle').checked,
            blurEnabled: document.getElementById('blur-toggle').checked,
            tooltipsEnabled: document.getElementById('tooltip-toggle').checked
        };
        
        // Save to server
        Utils.sendCallback('saveSettings', MenuState.settings);
        
        // Apply theme
        Utils.sendCallback('requestTheme', { theme: MenuState.settings.theme });
        
        this.close();
        Utils.playSound('select');
    }
};

// ═══════════════════════════════════════════════════════════════
// EVENT LISTENERS
// ═══════════════════════════════════════════════════════════════

// NUI Messages
window.addEventListener('message', (event) => {
    const data = event.data;
    
    switch (data.action) {
        case 'openMenu':
            MenuController.open(data);
            break;
            
        case 'closeMenu':
            MenuController.close();
            break;
            
        case 'updateItems':
            MenuRenderer.renderItems(data.items);
            MenuRenderer.updateBreadcrumb();
            break;
            
        case 'openSettings':
            SettingsController.open();
            break;
            
        case 'applyTheme':
            Utils.applyTheme(data.theme);
            break;
    }
});

// Keyboard Events
document.addEventListener('keydown', (event) => {
    if (event.key === 'Escape') {
        if (!document.getElementById('settings-panel').classList.contains('hidden')) {
            SettingsController.close();
        } else if (MenuState.isOpen) {
            if (MenuState.menuStack.length > 0) {
                MenuController.goBack();
            } else {
                MenuController.close();
            }
        }
    }
});

// Settings Panel Events
document.getElementById('close-settings')?.addEventListener('click', () => {
    SettingsController.close();
});

document.getElementById('save-settings')?.addEventListener('click', () => {
    SettingsController.save();
});

// Center Hub Click
document.getElementById('center-hub')?.addEventListener('click', () => {
    if (MenuState.menuStack.length > 0) {
        MenuController.goBack();
    }
});

// ═══════════════════════════════════════════════════════════════
// HELPER FUNCTION
// ═══════════════════════════════════════════════════════════════

function GetParentResourceName() {
    // Check if we're in NUI context
    if (window.location.hostname === '' || 
        window.location.hostname.startsWith('nui://')) {
        return 'lxr-radialmenu';
    }
    return window.location.hostname;
}

// ═══════════════════════════════════════════════════════════════
// INITIALIZATION
// ═══════════════════════════════════════════════════════════════

console.log('LXR Radial Menu v2.0 - Initialized');
