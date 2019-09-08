import { AppPage } from './app.po';

describe('workspace-project App Calculator', () => {
  let page: AppPage;

  beforeEach(() => {
    page = new AppPage();
  });

  it('should display the calculator', () => {
    page.navigateTo('/calculator');
    expect(page.getCalculator()).toBeDefined();
  });
});
