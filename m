From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [git pull] cpufreq governor updates for 2.6.17
Date: Sun, 26 Mar 2006 11:53:39 +0200
Message-ID: <20060326095338.GA17358@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com
Cc: cpufreq@lists.linux.org.uk

Hi Dave,

Please pull from
git://git.kernel.org/pub/scm/linux/kernel/git/brodo/cpufreq-2.6.git/ 
for a few cpufreq updates for 2.6.17. The diffstat and list of changes
follows, the patches will be sent out as individual mails as replies to this
message.

Thanks,
	Dominik

 drivers/cpufreq/cpufreq_conservative.c |  149 +++++++++++++--------------------
 drivers/cpufreq/cpufreq_ondemand.c     |   11 +-
 2 files changed, 70 insertions(+), 90 deletions(-)

Alexander Clouter:
      cpufreq_conservative: aligning of codebase with ondemand
      cpufreq_conservative: alter default responsiveness
      cpufreq_conservative: make for_each_cpu() safe
      cpufreq_conservative: alternative initialise approach

Dominik Brodowski:
      cpufreq_ondemand: add range check

Eric Piel:
      cpufreq_ondemand: Warn if it cannot run due to too long transition latency
      cpufreq_ondemand: keep ignore_nice_load value when it is reselected
