From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 2/2] xen/cpufreq: Disable the cpu frequency scaling drivers from loading.
Date: Tue, 13 Mar 2012 19:18:40 -0400
Message-ID: <1331680720-18268-3-git-send-email-konrad.wilk@oracle.com>
References: <1331680720-18268-1-git-send-email-konrad.wilk@oracle.com>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1331680720-18268-1-git-send-email-konrad.wilk@oracle.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, JBeulich@suse.com
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

By using the functionality provided by "[CPUFREQ]: provide
disable_cpuidle() function to disable the API."

Under the Xen hypervisor we do not want the initial domain to exercise
the cpufreq scaling drivers. This is b/c the Xen hypervisor is
in charge of doing this as well and we can end up with both the
Linux kernel and the hypervisor trying to change the P-states
leading to weird performance issues.

Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
---
 arch/x86/xen/setup.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index e03c636..4461e0a 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -420,6 +420,7 @@ void __init xen_arch_setup(void)
 	boot_cpu_data.hlt_works_ok = 1;
 #endif
 	disable_cpuidle();
+	disable_cpufreq();
 	boot_option_idle_override = IDLE_HALT;
 	WARN_ON(set_pm_idle_to_default());
 	fiddle_vdso();
-- 
1.7.9.48.g85da4d

