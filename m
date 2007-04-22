From: Rafal Bilski <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Revert Longhaul ver. 2
Date: Sun, 22 Apr 2007 12:27:04 +0200
Message-ID: <1177237624577-git-send-email-rafalbilski@interia.pl>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

There is something wrong with this code. It needs more
testing. It is better to disable it for now because support
for some machines will be broken.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu/cpufreq/longhaul.c
index 2b030d6..14dde62 100644
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -678,7 +678,7 @@ static int __init longhaul_cpu_init(struct cpufreq_policy *policy)
 				sizeof(samuel2_eblcr));
 			break;
 		case 1 ... 15:
-			longhaul_version = TYPE_LONGHAUL_V2;
+			longhaul_version = TYPE_LONGHAUL_V1;
 			if (c->x86_mask < 8) {
 				cpu_model = CPU_SAMUEL2;
 				cpuname = "C3 'Samuel 2' [C5B]";
-- 
1.5.0.6



----------------------------------------------------------------------
NIE KUPUJ!!!
...zanim nie porownasz cen >> http://link.interia.pl/f1a5e
