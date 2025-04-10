import i18next from 'i18next'
import I18NextVue from 'i18next-vue'
import LanguageDetector from 'i18next-browser-languagedetector'

import en from '@/locales/en.json';
import de from '@/locales/de.json';

i18next
  .use(LanguageDetector)
  .init({
    debug: true,
    fallbackLng: 'en',
    resources: {
      en: {
        translation: en
      },
      de: {
        translation: de
      }
    },
  });

export default function (app) {
  app.use(I18NextVue, { i18next })
  return app
}
