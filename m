From: Dave Jones <davej@redhat.com>
Subject: Re: Missing "unregister_cpu_notifier" in powernow-k8.c
Date: Tue, 23 Nov 2010 21:31:24 -0500
Message-ID: <20101124023124.GD1987@redhat.com>
References: <20101124112801.78830fba@notabene.brown>
 <20101124021938.GB1987@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101124021938.GB1987@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neil Brown <neilb@suse.de>, x86@kernel.org, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 23, 2010 at 09:19:38PM -0500, Dave Jones wrote:
 >  The following might be a partial fix, but I suspect there is probably other
 >  clean-up that is needed.

Indeed, looks like another possible leak in the unlikely event that the
percpu msr struct can't be allocated..
Instead of adding an unregister on fail, I think we can just move the registration later.

	Dave

diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
index 812778c..f0a80f1 100644
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
@@ -1556,14 +1556,14 @@ static int __cpuinit powernowk8_init(void)
 
                cpb_capable = true;
 
-               register_cpu_notifier(&cpb_nb);
-
                msrs = msrs_alloc();
                if (!msrs) {
                        printk(KERN_ERR "%s: Error allocating msrs!\n", __func__);
                        return -ENOMEM;
                }
 
+               register_cpu_notifier(&cpb_nb);
+
                rdmsr_on_cpus(cpu_online_mask, MSR_K7_HWCR, msrs);
 
                for_each_cpu(cpu, cpu_online_mask) {

