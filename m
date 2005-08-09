From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: cpufreq suspend patch.
Date: Tue, 09 Aug 2005 09:53:38 +0100
Message-ID: <1123577618.4512.21.camel@baythorne.infradead.org>
References: <20050808224401.GA3277@redhat.com>
	<1123576360.30257.153.camel@gaston>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1123576360.30257.153.camel@gaston>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: cpufreq@lists.linux.org.uk, Dave Jones <davej@redhat.com>

On Tue, 2005-08-09 at 10:32 +0200, Benjamin Herrenschmidt wrote:
> Can you compare with what's currently upstream ? (I'm still travelling
> around so it's more difficult for me).

It's very similar to what's upstream, but not identical. Your original
patch has some extra changes in cpufreq_resume()...

 static int cpufreq_resume(struct sys_device * sysdev)
 {
        int cpu = sysdev->id;
        unsigned int ret = 0;
+       unsigned int cur_freq = 0;
        struct cpufreq_policy *cpu_policy;
 
        dprintk("resuming cpu %u\n", cpu);
@@ -908,32 +988,34 @@
                }
        }
 
-       if (!(cpufreq_driver->flags & CPUFREQ_CONST_LOOPS)) {
-               unsigned int cur_freq = 0;
-
-               if (cpufreq_driver->get)
-                       cur_freq = cpufreq_driver->get(cpu_policy->cpu);
-
-               if (!cur_freq || !cpu_policy->cur) {
-                       printk(KERN_ERR "cpufreq: resume failed to assert current frequency is what timing core thinks it is.\n");
-                       goto out;
-               }
-
-               if (unlikely(cur_freq != cpu_policy->cur)) {
-                       struct cpufreq_freqs freqs;
+       if (cpufreq_driver->flags & CPUFREQ_CONST_LOOPS)
+               goto out;
 
-                       printk(KERN_WARNING "Warning: CPU frequency is %u, "
-                              "cpufreq assumed %u kHz.\n", cur_freq, cpu_policy->cur);
+       if (cpufreq_driver->get)
+               cur_freq = cpufreq_driver->get(cpu_policy->cpu);
 
-                       freqs.cpu = cpu;
-                       freqs.old = cpu_policy->cur;
-                       freqs.new = cur_freq;
+       if (!cur_freq || !cpu_policy->cur) {
+               printk(KERN_ERR "cpufreq: resume failed to assert current "
+                      "frequency is what timing core thinks it is.\n");
+               goto out;
+       }
 
-                       notifier_call_chain(&cpufreq_transition_notifier_list, CPUFREQ_RESUMECHANGE, &freqs);
-                       adjust_jiffies(CPUFREQ_RESUMECHANGE, &freqs);
+       if (unlikely(cur_freq != cpu_policy->cur)) {
+               struct cpufreq_freqs freqs;
 
-                       cpu_policy->cur = cur_freq;
-               }
+               if (!(cpufreq_driver->flags & CPUFREQ_PM_NO_WARN))
+                       printk(KERN_DEBUG "Warning: CPU frequency is %u, "
+                              "cpufreq assumed %u kHz.\n",
+                              cur_freq, cpu_policy->cur);
+
+               freqs.cpu = cpu;
+               freqs.old = cpu_policy->cur;
+               freqs.new = cur_freq;
+
+               notifier_call_chain(&cpufreq_transition_notifier_list,
+                                   CPUFREQ_RESUMECHANGE, &freqs);
+               adjust_jiffies(CPUFREQ_RESUMECHANGE, &freqs);
+               cpu_policy->cur = cur_freq;
        }
-- 
dwmw2
