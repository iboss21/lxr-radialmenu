let menuOpen = false;
let currentMenu = null;
let currentConfig = null;
let submenuOpen = false;
let holdInterval = null;
let holdTimer = null;

// Initialize NUI listener
window.addEventListener('message', function(event) {
    const data = event.data;
    
    switch(data.action) {
        case 'openMenu':
            openMenu(data.menuItems, data.config);
            break;
        case 'closeMenu':
            closeMenu();
            break;
    }
});

// Close menu on ESC
document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape' && menuOpen) {
        closeMenu();
    }
});

function openMenu(menuItems, config) {
    if (menuOpen) return;
    
    menuOpen = true;
    currentConfig = config;
    
    // Apply theme
    applyTheme(config.theme);
    
    // Show container
    const container = document.getElementById('radial-menu-container');
    container.classList.remove('hidden');
    
    // Set framework title
    const title = document.getElementById('menu-title');
    title.textContent = 'Radial Menu';
    title.setAttribute('data-framework', config.framework || 'RedM');
    title.classList.add('visible');
    
    // Apply background blur if enabled
    if (config.backgroundBlur) {
        container.style.backdropFilter = 'blur(5px)';
    }
    
    // Render menu items
    renderMenuItems(menuItems, config);
}

function closeMenu() {
    if (!menuOpen) return;
    
    menuOpen = false;
    submenuOpen = false;
    
    // Clear hold timer if active
    if (holdTimer) {
        clearTimeout(holdTimer);
        holdTimer = null;
    }
    if (holdInterval) {
        clearInterval(holdInterval);
        holdInterval = null;
    }
    
    // Hide container
    const container = document.getElementById('radial-menu-container');
    container.classList.add('hidden');
    
    // Clear menu items
    document.getElementById('menu-items').innerHTML = '';
    document.getElementById('submenu-items').innerHTML = '';
    document.getElementById('menu-title').classList.remove('visible');
    
    // Send close event to client
    fetch(`https://${GetParentResourceName()}/closeMenu`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
    });
}

function applyTheme(theme) {
    const root = document.documentElement;
    root.style.setProperty('--bg-color', theme.backgroundColor);
    root.style.setProperty('--primary-color', theme.primaryColor);
    root.style.setProperty('--hover-color', theme.hoverColor);
    root.style.setProperty('--text-color', theme.textColor);
}

function renderMenuItems(items, config) {
    const menuItemsContainer = document.getElementById('menu-items');
    menuItemsContainer.innerHTML = '';
    
    const radius = config.radius || 150;
    const angleStep = (2 * Math.PI) / items.length;
    
    items.forEach((item, index) => {
        const angle = angleStep * index - Math.PI / 2;
        const x = Math.cos(angle) * radius;
        const y = Math.sin(angle) * radius;
        
        const menuItem = document.createElement('div');
        menuItem.className = 'menu-item';
        menuItem.style.setProperty('--tx', `${x}px`);
        menuItem.style.setProperty('--ty', `${y}px`);
        menuItem.style.animationDelay = `${index * 0.05}s`;
        
        const icon = document.createElement('div');
        icon.className = 'menu-item-icon';
        icon.textContent = item.icon || '⚡';
        
        const label = document.createElement('div');
        label.className = 'menu-item-label';
        label.textContent = item.label;
        
        menuItem.appendChild(icon);
        menuItem.appendChild(label);
        
        // Handle click or hold based on config
        if (config.holdMode) {
            let holdStartTime = null;
            
            menuItem.addEventListener('mousedown', function() {
                holdStartTime = Date.now();
                playSound('hover');
                
                holdTimer = setTimeout(() => {
                    if (item.items && item.items.length > 0) {
                        playSound('open');
                        renderSubmenu(item.items, config);
                    } else if (item.action) {
                        playSound('select');
                        selectItem(item.action);
                    }
                }, 500); // 500ms hold time
            });
            
            menuItem.addEventListener('mouseup', function() {
                if (holdTimer) {
                    clearTimeout(holdTimer);
                    holdTimer = null;
                }
            });
            
            menuItem.addEventListener('mouseleave', function() {
                if (holdTimer) {
                    clearTimeout(holdTimer);
                    holdTimer = null;
                }
            });
        } else {
            // Press mode (default)
            menuItem.addEventListener('click', function() {
                playSound('select');
                if (item.items && item.items.length > 0) {
                    renderSubmenu(item.items, config);
                } else if (item.action) {
                    selectItem(item.action);
                }
            });
            
            menuItem.addEventListener('mouseenter', function() {
                playSound('hover');
            });
        }
        
        menuItemsContainer.appendChild(menuItem);
    });
}

function renderSubmenu(items, config) {
    if (submenuOpen) return;
    submenuOpen = true;
    
    const submenuContainer = document.getElementById('submenu-items');
    submenuContainer.innerHTML = '';
    
    const radius = (config.radius || 150) * 1.5;
    const angleStep = (2 * Math.PI) / items.length;
    
    items.forEach((item, index) => {
        const angle = angleStep * index - Math.PI / 2;
        const x = Math.cos(angle) * radius;
        const y = Math.sin(angle) * radius;
        
        const submenuItem = document.createElement('div');
        submenuItem.className = 'submenu-item';
        submenuItem.style.setProperty('--tx', `${x}px`);
        submenuItem.style.setProperty('--ty', `${y}px`);
        submenuItem.style.animationDelay = `${index * 0.05}s`;
        
        const label = document.createElement('div');
        label.className = 'submenu-item-label';
        label.textContent = item.label;
        
        submenuItem.appendChild(label);
        
        submenuItem.addEventListener('click', function() {
            playSound('select');
            if (item.action) {
                selectItem(item.action);
            }
        });
        
        submenuItem.addEventListener('mouseenter', function() {
            playSound('hover');
        });
        
        submenuContainer.appendChild(submenuItem);
    });
}

function selectItem(action) {
    fetch(`https://${GetParentResourceName()}/selectItem`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ action: action })
    });
}

function playSound(type) {
    if (!currentConfig || !currentConfig.soundEffects) return;
    
    // Play sound based on type
    const audio = new Audio();
    switch(type) {
        case 'open':
            // Menu open sound
            break;
        case 'hover':
            // Hover sound (subtle)
            break;
        case 'select':
            // Selection sound
            break;
    }
}

// Helper function to get resource name
function GetParentResourceName() {
    let url = window.location.href;
    let match = url.match(/https?:\/\/\w+\/(\w+)\//);
    return match ? match[1] : 'lxr-radialmenu';
}
