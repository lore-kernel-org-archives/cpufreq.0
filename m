From: Len Brown <len.brown@intel.com>
Subject: Re: [PATCH] speedstep-centrino should ignore upper performance
	control bits
Date: Tue, 7 Nov 2006 02:09:39 -0500
Message-ID: <200611070209.39817.len.brown@intel.com>
References: <20061106233923.GA15063@us.ibm.com>
	<20061107021441.GA10457@isilmar.linta.de>
Reply-To: Len Brown <lenb@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20061107021441.GA10457@isilmar.linta.de>
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
To: cpufreq@lists.linux.org.uk
Cc: davej@redhat.com, Dominik Brodowski <linux@dominikbrodowski.net>

On Monday 06 November 2006 21:14, Dominik Brodowski wrote:
> On Mon, Nov 06, 2006 at 03:39:23PM -0800, Gary Hade wrote:
> > 
> > On some systems such as the IBM x3650 there are bits set in the 
> > upper half of the control values provided by the _PSS object.  
> > These bits are only relevant for cpufreq drivers that use IO ports 
> > which are not currently supported by the speedstep-centrino driver.  
> ... and probably never will.
> 
> > The current MSR oriented code assumes that upper bits are not set 
> > and thus fails to work correctly when they are.  e.g. the control 
> > and status value equality check fails even though the ACPI spec 
> > allows the inequality.

> How does the acpi-cpufreq driver work with it?

acpu-cpufreq.c in Linus' tree is still IO only.
acpi-cpufreq. in Dave's tree changed to do this:
where  #define INTEL_MSR_RANGE                (0xffff)

-        cmd.addr.port = perf->control_register.address;
-        cmd.addr.bit_width = perf->control_register.bit_width;
-        cmd.val = (u32) perf->states[next_perf_state].control;
+        switch (data->cpu_feature) {
+            case SYSTEM_INTEL_MSR_CAPABLE:
+                cmd.type = SYSTEM_INTEL_MSR_CAPABLE;
+                cmd.addr.msr.reg = MSR_IA32_PERF_CTL;
+                msr = (u32) perf->states[next_perf_state].control & INTEL_MSR_RANGE;
+                cmd.val = (cmd.val & ~INTEL_MSR_RANGE) | msr;
+                break;
+            case SYSTEM_IO_CAPABLE:
+                cmd.type = SYSTEM_IO_CAPABLE;
+                cmd.addr.io.port = perf->control_register.address;
+                cmd.addr.io.bit_width = perf->control_register.bit_width;
+                cmd.val = (u32) perf->states[next_perf_state].control;
+                break;
