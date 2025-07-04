import {
  CheckboxInput,
  Feature,
  FeatureChoiced,
  FeatureSliderInput,
  FeatureToggle,
} from '../base';
import { FeatureDropdownInput } from '../dropdowns';

export const sound_ambience_volume: Feature<number> = {
  name: 'Ambience volume',
  category: 'SOUND',
  description: `Ambience refers to the more noticeable ambient sounds that play on occasion.`,
  component: FeatureSliderInput,
};

export const sound_breathing: FeatureToggle = {
  name: 'Enable breathing sounds',
  category: 'SOUND',
  description: 'When enabled, hear breathing sounds when using internals.',
  component: CheckboxInput,
};

export const sound_announcements: FeatureToggle = {
  name: 'Enable announcement sounds',
  category: 'SOUND',
  description: 'When enabled, hear sounds for command reports, notices, etc.',
  component: CheckboxInput,
};

export const sound_combatmode: FeatureToggle = {
  name: 'Enable combat mode sound',
  category: 'SOUND',
  description: 'When enabled, hear sounds when toggling combat mode.',
  component: CheckboxInput,
};

export const sound_endofround: FeatureToggle = {
  name: 'Enable end of round sounds',
  category: 'SOUND',
  description: 'When enabled, hear a sound when the server is rebooting.',
  component: CheckboxInput,
};

export const sound_instruments: FeatureToggle = {
  name: 'Enable instruments',
  category: 'SOUND',
  description: 'When enabled, be able hear instruments in game.',
  component: CheckboxInput,
};

export const sound_tts: FeatureChoiced = {
  name: 'Enable TTS',
  category: 'SOUND',
  description: `
    When enabled, be able to hear text-to-speech sounds in game.
    When set to "Blips", text to speech will be replaced with blip sounds based on the voice.
  `,
  component: FeatureDropdownInput,
};

export const sound_tts_volume: Feature<number> = {
  name: 'TTS Volume',
  category: 'SOUND',
  description: 'The volume that the text-to-speech sounds will play at.',
  component: FeatureSliderInput,
};

export const sound_jukebox: FeatureToggle = {
  name: 'Enable jukebox music',
  category: 'SOUND',
  description: 'When enabled, hear music for jukeboxes, dance machines, etc.',
  component: CheckboxInput,
};

export const sound_lobby_volume: Feature<number> = {
  name: 'Lobby music volume',
  category: 'SOUND',
  component: FeatureSliderInput,
};

export const sound_midi: FeatureToggle = {
  name: 'Enable admin music',
  category: 'SOUND',
  description: 'When enabled, admins will be able to play music to you.',
  component: CheckboxInput,
};

export const sound_ship_ambience_volume: Feature<number> = {
  name: 'Ambience Buzz',
  category: 'SOUND',
  description: `Raise or lower the sound of the constant background noise that plays depending on the area you are in.`,
  component: FeatureSliderInput,
};

export const sound_elevator: FeatureToggle = {
  name: 'Enable elevator music',
  category: 'SOUND',
  component: CheckboxInput,
};

export const sound_achievement: FeatureChoiced = {
  name: 'Achievement unlock sound',
  category: 'SOUND',
  description: `
    The sound that's played when unlocking an achievement.
    If disabled, no sound will be played.
  `,
  component: FeatureDropdownInput,
};

export const sound_radio_noise: Feature<number> = {
  name: 'Radio noise volume',
  category: 'SOUND',
  description: `Volume of talking and hearing radio chatter sounds.`,
  component: FeatureSliderInput,
};

export const sound_ai_vox: FeatureToggle = {
  name: 'Enable AI VOX announcements',
  category: 'SOUND',
  description:
    'When enabled, hear vocal AI announcements (also known as "VOX").',
  component: CheckboxInput,
};
