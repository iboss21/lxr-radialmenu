/**
 * ════════════════════════════════════════════════════════════════
 *              THE LAND OF WOLVES - Settings UI
 *                    1899 Western Theme
 *                www.wolves.land / iBoss
 * ════════════════════════════════════════════════════════════════
 */

// 1899 Period-Accurate Menu Items (Western Era)
const WESTERN_COMMANDS = {
    'Ledger': '📜',           // Settings (Sheriff's ledger)
    'Telegraph': '📨',        // Phone (Telegraph office)
    'Saddlebags': '🎒',       // Inventory (Satchel)
    'Wardrobe': '🤠',         // Clothes (Hat & coat)
    'Gestures': '🎭',         // Emotes
    'Money Pouch': '💰',      // Wallet
    'Trade': '⚒️',            // Job
    'Horse/Wagon': '🐴'       // Vehicles
};

const DEFAULT_COMMANDS = Object.keys(WESTERN_COMMANDS);
const MAX_COMMANDS = 8;

// Initialize settings
let currentSettings = {
    theme: 'wolves',
    backgroundBlur: true,
    behaviour: 'press',
    soundEffect: true,
    coloredMenus: true,
    commands: [...DEFAULT_COMMANDS]
};

let draggedElement = null;
let draggedIndex = null;

// ════════════════════════════════════════════════════════════════
// INITIALIZATION
// ════════════════════════════════════════════════════════════════
document.addEventListener('DOMContentLoaded', function() {
    initializeSettings();
    setupEventListeners();
    renderCommandsList();
    renderRadialPreview();
});

// NUI Message Listener
window.addEventListener('message', function(event) {
    const data = event.data;
    
    switch(data.action) {
        case 'openSettings':
            openSettings(data.settings);
            break;
        case 'closeSettings':
            closeSettings();
            break;
    }
});

// Initialize settings from localStorage or defaults
function initializeSettings() {
    const savedSettings = localStorage.getItem('tlw_radial_settings');
    if (savedSettings) {
        try {
            currentSettings = JSON.parse(savedSettings);
            // Ensure commands array exists and is valid
            if (!currentSettings.commands || !Array.isArray(currentSettings.commands)) {
                currentSettings.commands = [...DEFAULT_COMMANDS];
            }
        } catch(e) {
            console.error('Failed to load settings:', e);
            currentSettings.commands = [...DEFAULT_COMMANDS];
        }
    }
    applySettings();
}

// Apply settings to UI
function applySettings() {
    document.getElementById('theme-select').value = currentSettings.theme || 'wolves';
    document.getElementById('bg-blur').checked = currentSettings.backgroundBlur !== false;
    document.getElementById('sound-effect').checked = currentSettings.soundEffect !== false;
    document.getElementById('colored-menus').checked = currentSettings.coloredMenus !== false;
    
    const behaviourRadios = document.querySelectorAll('input[name="behaviour"]');
    behaviourRadios.forEach(radio => {
        radio.checked = radio.value === (currentSettings.behaviour || 'press');
    });
}

// Save settings
function saveSettings() {
    localStorage.setItem('tlw_radial_settings', JSON.stringify(currentSettings));
    
    // Send to game client
    fetch(`https://${GetParentResourceName()}/saveSettings`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(currentSettings)
    }).catch(() => {
        console.log('Failed to save settings to client (expected in browser)');
    });
    
    playSound('save');
}

// ════════════════════════════════════════════════════════════════
// EVENT LISTENERS
// ════════════════════════════════════════════════════════════════
function setupEventListeners() {
    // Tab navigation
    const navTabs = document.querySelectorAll('.nav-tab');
    navTabs.forEach(tab => {
        tab.addEventListener('click', function() {
            switchTab(this.dataset.tab);
            playSound('click');
        });
    });
    
    // Theme select
    document.getElementById('theme-select').addEventListener('change', function() {
        currentSettings.theme = this.value;
        saveSettings();
        renderRadialPreview();
        playSound('select');
    });
    
    // Background blur toggle
    document.getElementById('bg-blur').addEventListener('change', function() {
        currentSettings.backgroundBlur = this.checked;
        saveSettings();
        playSound('toggle');
    });
    
    // Behaviour radio buttons
    const behaviourRadios = document.querySelectorAll('input[name="behaviour"]');
    behaviourRadios.forEach(radio => {
        radio.addEventListener('change', function() {
            currentSettings.behaviour = this.value;
            saveSettings();
            playSound('select');
        });
    });
    
    // Sound effect toggle
    document.getElementById('sound-effect').addEventListener('change', function() {
        currentSettings.soundEffect = this.checked;
        saveSettings();
        playSound('toggle');
    });
    
    // Colored menus toggle
    document.getElementById('colored-menus').addEventListener('change', function() {
        currentSettings.coloredMenus = this.checked;
        saveSettings();
        renderRadialPreview();
        playSound('toggle');
    });
    
    // Close button
    document.getElementById('close-settings').addEventListener('click', function() {
        closeSettings();
    });
    
    // ESC key to close
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            closeSettings();
        }
    });
    
    // Revert button
    const revertBtn = document.querySelector('.revert-button');
    if (revertBtn) {
        revertBtn.addEventListener('click', function() {
            revertToDefaults();
            playSound('click');
        });
    }
}

// ════════════════════════════════════════════════════════════════
// TAB SWITCHING
// ════════════════════════════════════════════════════════════════
function switchTab(tabName) {
    // Update nav tabs
    document.querySelectorAll('.nav-tab').forEach(tab => {
        tab.classList.remove('active');
    });
    const activeTab = document.querySelector(`[data-tab="${tabName}"]`);
    if (activeTab) {
        activeTab.classList.add('active');
    }
    
    // Update content
    document.querySelectorAll('.tab-content').forEach(content => {
        content.classList.remove('active');
    });
    const activeContent = document.querySelector(`[data-content="${tabName}"]`);
    if (activeContent) {
        activeContent.classList.add('active');
    }
}

// ════════════════════════════════════════════════════════════════
// COMMANDS LIST - DRAG & DROP
// ════════════════════════════════════════════════════════════════
function renderCommandsList() {
    const commandsList = document.getElementById('commands-list');
    if (!commandsList) return;
    
    commandsList.innerHTML = '';
    
    currentSettings.commands.forEach((command, index) => {
        const commandItem = document.createElement('div');
        commandItem.className = 'command-item';
        commandItem.draggable = true;
        commandItem.dataset.index = index;
        commandItem.dataset.command = command;
        
        const icon = WESTERN_COMMANDS[command] || '❓';
        
        commandItem.innerHTML = `
            <div class="command-content">
                <span class="command-icon">${icon}</span>
                <span class="command-label">${command}</span>
            </div>
            <div class="command-actions">
                <button class="action-btn drag-handle" title="Drag to reorder">⋮⋮</button>
                <button class="action-btn delete" title="Delete" data-command="${command}">🗑️</button>
            </div>
        `;
        
        // Drag and drop events
        commandItem.addEventListener('dragstart', handleDragStart);
        commandItem.addEventListener('dragover', handleDragOver);
        commandItem.addEventListener('drop', handleDrop);
        commandItem.addEventListener('dragend', handleDragEnd);
        commandItem.addEventListener('dragenter', handleDragEnter);
        commandItem.addEventListener('dragleave', handleDragLeave);
        
        // Delete button
        const deleteBtn = commandItem.querySelector('.delete');
        deleteBtn.addEventListener('click', function(e) {
            e.stopPropagation();
            deleteCommand(command, index);
        });
        
        commandsList.appendChild(commandItem);
    });
    
    renderRadialPreview();
}

// ════════════════════════════════════════════════════════════════
// DRAG AND DROP HANDLERS
// ════════════════════════════════════════════════════════════════
function handleDragStart(e) {
    draggedElement = this;
    draggedIndex = parseInt(this.dataset.index);
    this.classList.add('dragging');
    e.dataTransfer.effectAllowed = 'move';
    e.dataTransfer.setData('text/html', this.innerHTML);
    playSound('drag');
}

function handleDragOver(e) {
    if (e.preventDefault) {
        e.preventDefault();
    }
    e.dataTransfer.dropEffect = 'move';
    return false;
}

function handleDragEnter(e) {
    if (this !== draggedElement) {
        this.classList.add('drag-over');
    }
}

function handleDragLeave(e) {
    this.classList.remove('drag-over');
}

function handleDrop(e) {
    if (e.stopPropagation) {
        e.stopPropagation();
    }
    
    if (draggedElement !== this) {
        const dropIndex = parseInt(this.dataset.index);
        
        // Reorder commands array
        const draggedCommand = currentSettings.commands[draggedIndex];
        currentSettings.commands.splice(draggedIndex, 1);
        currentSettings.commands.splice(dropIndex, 0, draggedCommand);
        
        saveSettings();
        renderCommandsList();
        playSound('drop');
    }
    
    this.classList.remove('drag-over');
    return false;
}

function handleDragEnd(e) {
    this.classList.remove('dragging');
    document.querySelectorAll('.command-item').forEach(item => {
        item.classList.remove('drag-over');
    });
}

// ════════════════════════════════════════════════════════════════
// COMMAND MANAGEMENT
// ════════════════════════════════════════════════════════════════
function deleteCommand(command, index) {
    if (currentSettings.commands.length <= 1) {
        showNotification('Cannot delete - At least one command is required!', 'error');
        playSound('error');
        return;
    }
    
    if (confirm(`Remove "${command}" from the radial menu?`)) {
        currentSettings.commands.splice(index, 1);
        saveSettings();
        renderCommandsList();
        showNotification(`"${command}" removed successfully`, 'success');
        playSound('delete');
    }
}

function addCommand() {
    if (currentSettings.commands.length >= MAX_COMMANDS) {
        showNotification(`Maximum ${MAX_COMMANDS} commands reached!`, 'error');
        playSound('error');
        return;
    }
    
    // Find commands not in use
    const availableCommands = DEFAULT_COMMANDS.filter(
        cmd => !currentSettings.commands.includes(cmd)
    );
    
    if (availableCommands.length === 0) {
        showNotification('All commands are already added!', 'warning');
        playSound('error');
        return;
    }
    
    // Add first available command
    const newCommand = availableCommands[0];
    currentSettings.commands.push(newCommand);
    saveSettings();
    renderCommandsList();
    showNotification(`"${newCommand}" added successfully`, 'success');
    playSound('add');
}

function revertToDefaults() {
    if (confirm('Reset all commands to default configuration?')) {
        currentSettings.commands = [...DEFAULT_COMMANDS];
        saveSettings();
        renderCommandsList();
        showNotification('Commands reset to defaults', 'success');
        playSound('reset');
    }
}

// ════════════════════════════════════════════════════════════════
// RADIAL PREVIEW
// ════════════════════════════════════════════════════════════════
function renderRadialPreview() {
    const previewItems = document.getElementById('preview-items');
    if (!previewItems) return;
    
    previewItems.innerHTML = '';
    
    const itemCount = currentSettings.commands.length;
    const radius = 120; // Distance from center
    const angleStep = (2 * Math.PI) / itemCount;
    
    currentSettings.commands.forEach((command, index) => {
        const angle = angleStep * index - (Math.PI / 2); // Start from top
        const x = Math.cos(angle) * radius;
        const y = Math.sin(angle) * radius;
        
        const previewItem = document.createElement('div');
        previewItem.className = 'preview-item';
        previewItem.style.transform = `translate(${x}px, ${y}px)`;
        
        const icon = WESTERN_COMMANDS[command] || '❓';
        
        previewItem.innerHTML = `
            <span class="preview-item-icon">${icon}</span>
            <span class="preview-item-label">${command}</span>
        `;
        
        previewItems.appendChild(previewItem);
    });
}

// ════════════════════════════════════════════════════════════════
// NOTIFICATIONS
// ════════════════════════════════════════════════════════════════
function showNotification(message, type = 'info') {
    // Create notification element
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        padding: 15px 25px;
        background: ${type === 'error' ? '#8B0000' : type === 'success' ? '#2C7A2C' : '#B8860B'};
        color: #F5F5DC;
        border: 3px solid ${type === 'error' ? '#a00000' : type === 'success' ? '#3a9a3a' : '#DAA520'};
        border-radius: 3px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
        font-family: 'Crimson Text', serif;
        font-size: 16px;
        font-weight: 600;
        z-index: 10000;
        animation: slideInNotification 0.3s ease;
    `;
    notification.textContent = message;
    
    document.body.appendChild(notification);
    
    // Auto remove after 3 seconds
    setTimeout(() => {
        notification.style.animation = 'slideOutNotification 0.3s ease';
        setTimeout(() => {
            document.body.removeChild(notification);
        }, 300);
    }, 3000);
}

// Add notification animations
const style = document.createElement('style');
style.textContent = `
    @keyframes slideInNotification {
        from {
            transform: translateX(400px);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }
    
    @keyframes slideOutNotification {
        from {
            transform: translateX(0);
            opacity: 1;
        }
        to {
            transform: translateX(400px);
            opacity: 0;
        }
    }
`;
document.head.appendChild(style);

// ════════════════════════════════════════════════════════════════
// SOUND EFFECTS
// ════════════════════════════════════════════════════════════════
const sounds = {
    click: 'https://assets.mixkit.co/active_storage/sfx/2568/2568-preview.mp3',
    toggle: 'https://assets.mixkit.co/active_storage/sfx/2571/2571-preview.mp3',
    select: 'https://assets.mixkit.co/active_storage/sfx/2570/2570-preview.mp3',
    save: 'https://assets.mixkit.co/active_storage/sfx/2869/2869-preview.mp3',
    delete: 'https://assets.mixkit.co/active_storage/sfx/2573/2573-preview.mp3',
    add: 'https://assets.mixkit.co/active_storage/sfx/2568/2568-preview.mp3',
    drag: 'https://assets.mixkit.co/active_storage/sfx/2570/2570-preview.mp3',
    drop: 'https://assets.mixkit.co/active_storage/sfx/2571/2571-preview.mp3',
    error: 'https://assets.mixkit.co/active_storage/sfx/2577/2577-preview.mp3',
    reset: 'https://assets.mixkit.co/active_storage/sfx/2869/2869-preview.mp3'
};

function playSound(soundName) {
    if (!currentSettings.soundEffect) return;
    
    try {
        const audio = new Audio(sounds[soundName]);
        audio.volume = 0.3;
        audio.play().catch(() => {
            // Silently fail if sound doesn't play
        });
    } catch(e) {
        // Silently fail
    }
}

// ════════════════════════════════════════════════════════════════
// OPEN/CLOSE SETTINGS
// ════════════════════════════════════════════════════════════════
function openSettings(settings) {
    if (settings) {
        currentSettings = { ...currentSettings, ...settings };
        applySettings();
        renderCommandsList();
        renderRadialPreview();
    }
    
    const container = document.getElementById('settings-container');
    container.classList.remove('hidden');
    playSound('open');
}

function closeSettings() {
    const container = document.getElementById('settings-container');
    container.classList.add('hidden');
    
    // Send close event to client
    fetch(`https://${GetParentResourceName()}/closeSettings`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
    }).catch(() => {
        console.log('Failed to send close event (expected in browser)');
    });
    
    playSound('close');
}

// ════════════════════════════════════════════════════════════════
// HELPER FUNCTIONS
// ════════════════════════════════════════════════════════════════
function GetParentResourceName() {
    if (window.GetParentResourceName) {
        return window.GetParentResourceName();
    }
    // For browser testing
    return 'lxr-radialmenu';
}

// Export functions for external access
window.WolvesSettings = {
    open: openSettings,
    close: closeSettings,
    saveSettings: saveSettings,
    addCommand: addCommand,
    deleteCommand: deleteCommand,
    revertToDefaults: revertToDefaults
};
