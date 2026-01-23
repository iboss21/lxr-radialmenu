/**
 * ════════════════════════════════════════════════════════════════
 *              THE LAND OF WOLVES - Settings UI
 *                    1899 Western Theme
 *                www.wolves.land / iBoss
 * ════════════════════════════════════════════════════════════════
 */

// 1899 Period-Accurate Menu Labels
const WESTERN_LABELS = {
    'Ledger': '📜',
    'Telegraph': '📨',
    'Saddlebags': '🎒',
    'Wardrobe': '🤠',
    'Gestures': '🎭',
    'Money Pouch': '💰',
    'Trade': '⚒️',
    'Horse/Wagon': '🐴'
};

// Initialize settings
let currentSettings = {
    theme: 'wolves',
    backgroundBlur: true,
    behaviour: 'press',
    soundEffect: true,
    coloredMenus: true,
    commands: Object.keys(WESTERN_LABELS)
};

// Initialize on page load
document.addEventListener('DOMContentLoaded', function() {
    initializeSettings();
    setupEventListeners();
    renderCommandsList();
    renderRadialPreview();
});

// Initialize settings from localStorage or defaults
function initializeSettings() {
    const savedSettings = localStorage.getItem('tlw_radial_settings');
    if (savedSettings) {
        currentSettings = JSON.parse(savedSettings);
        applySettings();
    }
}

// Apply settings to UI
function applySettings() {
    document.getElementById('theme-select').value = currentSettings.theme;
    document.getElementById('bg-blur').checked = currentSettings.backgroundBlur;
    document.getElementById('sound-effect').checked = currentSettings.soundEffect;
    document.getElementById('colored-menus').checked = currentSettings.coloredMenus;
    
    const behaviourRadios = document.querySelectorAll('input[name="behaviour"]');
    behaviourRadios.forEach(radio => {
        radio.checked = radio.value === currentSettings.behaviour;
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
    });
    
    playSound('save');
}

// Setup event listeners
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

// Switch tab
function switchTab(tabName) {
    // Update nav tabs
    document.querySelectorAll('.nav-tab').forEach(tab => {
        tab.classList.remove('active');
    });
    document.querySelector(`[data-tab="${tabName}"]`).classList.add('active');
    
    // Update content
    document.querySelectorAll('.tab-content').forEach(content => {
        content.classList.remove('active');
    });
    document.querySelector(`[data-content="${tabName}"]`).classList.add('active');
}

// Render commands list for customize tab
function renderCommandsList() {
    const commandsList = document.getElementById('commands-list');
    if (!commandsList) return;
    
    commandsList.innerHTML = '';
    
    currentSettings.commands.forEach((command, index) => {
        const commandItem = document.createElement('div');
        commandItem.className = 'command-item';
        commandItem.draggable = true;
        commandItem.dataset.index = index;
        
        commandItem.innerHTML = `
            <span class="drag-handle">⋮⋮</span>
            <span class="command-label">${command}</span>
            <span class="delete-icon" data-command="${command}">✕</span>
        `;
        
        // Drag and drop
        commandItem.addEventListener('dragstart', handleDragStart);
        commandItem.addEventListener('dragover', handleDragOver);
        commandItem.addEventListener('drop', handleDrop);
        commandItem.addEventListener('dragend', handleDragEnd);
        
        // Delete button
        const deleteBtn = commandItem.querySelector('.delete-icon');
        deleteBtn.addEventListener('click', function() {
            deleteCommand(command);
        });
        
        commandsList.appendChild(commandItem);
    });
}

// Drag and drop handlers
let draggedElement = null;

function handleDragStart(e) {
    draggedElement = this;
    this.style.opacity = '0.5';
    e.dataTransfer.effectAllowed = 'move';
}

function handleDragOver(e) {
    if (e.preventDefault) {
        e.preventDefault();
    }
    e.dataTransfer.dropEffect = 'move';
    return false;
}

function handleDrop(e) {
    if (e.stopPropagation) {
        e.stopPropagation();
    }
    
    if (draggedElement !== this) {
        const draggedIndex = parseInt(draggedElement.dataset.index);
        const targetIndex = parseInt(this.dataset.index);
        
        // Swap commands
        const temp = currentSettings.commands[draggedIndex];
        currentSettings.commands[draggedIndex] = currentSettings.commands[targetIndex];
        currentSettings.commands[targetIndex] = temp;
        
        saveSettings();
        renderCommandsList();
        renderRadialPreview();
        playSound('swap');
    }
    
    return false;
}

function handleDragEnd(e) {
    this.style.opacity = '1';
}

// Delete command
function deleteCommand(command) {
    const index = currentSettings.commands.indexOf(command);
    if (index > -1) {
        currentSettings.commands.splice(index, 1);
        saveSettings();
        renderCommandsList();
        renderRadialPreview();
        playSound('delete');
    }
}

// Revert to defaults
function revertToDefaults() {
    currentSettings.commands = Object.keys(WESTERN_LABELS);
    saveSettings();
    renderCommandsList();
    renderRadialPreview();
}

// Render radial preview
function renderRadialPreview() {
    const previewItems = document.getElementById('preview-items');
    if (!previewItems) return;
    
    previewItems.innerHTML = '';
    
    const numItems = Math.min(currentSettings.commands.length, 8);
    const radius = 110; // Distance from center
    const angleStep = (2 * Math.PI) / numItems;
    
    for (let i = 0; i < numItems; i++) {
        const command = currentSettings.commands[i];
        const angle = angleStep * i - Math.PI / 2; // Start at top
        
        const x = 140 + Math.cos(angle) * radius; // 140 is center
        const y = 140 + Math.sin(angle) * radius;
        
        const item = document.createElement('div');
        item.className = 'preview-item';
        item.style.left = x + 'px';
        item.style.top = y + 'px';
        item.style.animationDelay = `${i * 0.08}s`;
        item.textContent = WESTERN_LABELS[command] || '⚡';
        
        previewItems.appendChild(item);
    }
}

// Close settings
function closeSettings() {
    const container = document.getElementById('settings-container');
    container.classList.add('hidden');
    
    fetch(`https://${GetParentResourceName()}/closeSettings`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
    });
}

// Play sound effect
function playSound(type) {
    if (!currentSettings.soundEffect) return;
    
    // Simple audio feedback (can be replaced with actual audio files)
    const audio = new Audio();
    switch(type) {
        case 'click':
            // Click sound
            break;
        case 'toggle':
            // Toggle sound
            break;
        case 'select':
            // Select sound
            break;
        case 'save':
            // Save sound
            break;
        case 'swap':
            // Swap sound
            break;
        case 'delete':
            // Delete sound
            break;
    }
}

// Get parent resource name
function GetParentResourceName() {
    let url = window.location.href;
    let match = url.match(/https?:\/\/\w+\/(\w+)\//);
    return match ? match[1] : 'lxr-radialmenu';
}

// Listen for messages from game
window.addEventListener('message', function(event) {
    const data = event.data;
    
    if (data.action === 'openSettings') {
        document.getElementById('settings-container').classList.remove('hidden');
        if (data.settings) {
            currentSettings = data.settings;
            applySettings();
            renderCommandsList();
            renderRadialPreview();
        }
    } else if (data.action === 'closeSettings') {
        closeSettings();
    }
});
