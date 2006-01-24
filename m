From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH 2/2] _PPC frequency change issues
Date: Tue, 24 Jan 2006 09:06:27 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB6007000574@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
To: Thomas Renninger <trenn@suse.de>, cpufreq@www.linux.org.uk
Cc: Kernel Mailing List <linux-kernel@vger.kernel.org>, Dominik Brodowski <linux@brodo.de>


Thanks for identifying the issues and sendint these patches Thomas.

Patch 1 looks clean. New lines seem to contain spaces instead of tabs.
The same issue is there in patch 2 as well. Can you resent it with
indentation fixed.

Patch 2 I am concenred with following hunk.

@@ -161,16 +158,17 @@
 		cpu_max_freq[cpu] =3D policy->max;
 		dprintk("limit event for cpu %u: %u - %u kHz, currently
%u kHz, last set to %u kHz\n", cpu, cpu_min_freq[cpu],
cpu_max_freq[cpu], cpu_cur_freq[cpu], cpu_set_freq[cpu]);
 		if (policy->max < cpu_set_freq[cpu]) {
-			__cpufreq_driver_target(&current_policy[cpu],
policy->max,=20
-			      CPUFREQ_RELATION_H);
+            if (!__cpufreq_driver_target(policy, policy->max,=20
+                            CPUFREQ_RELATION_H))
+                cpu_cur_freq[cpu] =3D policy->max;

Should this me cpu_cur_freq[cpu] =3D policy->cur instead. As the max
setting may not be supported by the driver, it might have set some
closer available freq

Same comment for below two driver target calls as well.


 		} else if (policy->min > cpu_set_freq[cpu]) {
-			__cpufreq_driver_target(&current_policy[cpu],
policy->min,=20
-			      CPUFREQ_RELATION_L);
+            if (!__cpufreq_driver_target(policy, policy->min,=20
+                            CPUFREQ_RELATION_L))
+                cpu_cur_freq[cpu] =3D policy->min;
 		} else {
-			__cpufreq_driver_target(&current_policy[cpu],
cpu_set_freq[cpu],
+            __cpufreq_driver_target(policy, cpu_set_freq[cpu],
 			      CPUFREQ_RELATION_L);
 		}


Thx,
Venki

>-----Original Message-----
>From: Thomas Renninger [mailto:trenn@suse.de]=20
>Sent: Tuesday, January 24, 2006 8:18 AM
>To: cpufreq@www.linux.org.uk
>Cc: Pallipadi, Venkatesh; Dominik Brodowski; Kernel Mailing List
>Subject: [PATCH 2/2] _PPC frequency change issues
>
>and the second one fixing the usergovernor for these machines...
>
