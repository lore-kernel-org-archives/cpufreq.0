From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 1/2] acpi cpufreq cleanup: Move bailing out of function before
	locking the mutex
Date: Fri, 25 Jul 2008 15:58:56 +0200
Message-ID: <1216994337-6613-2-git-send-email-trenn@suse.de>
References: <1216994337-6613-1-git-send-email-trenn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1216994337-6613-1-git-send-email-trenn@suse.de>
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
To: davej@codemonkey.org.uk
Cc: akpm@osdl.org, cpufreq@lists.linux.org.uk, Andrew Morton <akpm@linux-foundation.org>, miguel@novell.com

Signed-off-by: Thomas Renninger <trenn@suse.de>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---
 drivers/acpi/processor_perflib.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/processor_perflib.c b/drivers/acpi/processor_perflib.c
index d80b2d1..4d16f59 100644
--- a/drivers/acpi/processor_perflib.c
+++ b/drivers/acpi/processor_perflib.c
@@ -84,10 +84,10 @@ static int acpi_processor_ppc_notifier(struct notifier_block *nb,
 	if (ignore_ppc)
 		return 0;
 
-	mutex_lock(&performance_mutex);
-
 	if (event != CPUFREQ_INCOMPATIBLE)
-		goto out;
+		return 0;
+
+	mutex_lock(&performance_mutex);
 
 	pr = processors[policy->cpu];
 	if (!pr || !pr->performance)
-- 
1.5.4.5
