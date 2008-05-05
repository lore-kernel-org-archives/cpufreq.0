From: Goran <gkoruga@siol.net>
Subject: cpufreq and modular build
Date: Mon, 5 May 2008 17:58:17 +0200
Message-ID: <20080505175817.3ee17fb6@cornholio.confused.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: cpufreq@lists.linux.org.uk

Hello.

I have a question regarding cpufreq and modular build.

Looking in Kconfig file for 2.6.24.5 kernel version I see this:

---------------------------------------------------------------------------
config CPU_FREQ
        bool "CPU Frequency scaling"
        help
          CPU Frequency scaling allows you to change the clock speed of
          CPUs on the fly. This is a nice method to save power, because
          the lower the CPU clock speed, the less power the CPU consumes.

          Note that this driver doesn't automatically change the CPU
          clock speed, you need to either enable a dynamic cpufreq governor
          (see below) after boot, or use a userspace tool.

          To compile this driver as a module, choose M here: the
          module will be called cpufreq.

          For details, take a look at <file:Documentation/cpu-freq>.

          If in doubt, say N.
---------------------------------------------------------------------------

So there's a discrepancy between the way this setting is added in the
Kconfig file and the help text.  Help text suggests this can be built as a
module, and there is also (some?) support for that in the source code,
but Kconfig file does not allow one to build it as a module.

Which bit needs fixing - help text or the "bool" setting?

Please cc: me on replies as I am not subscribed to the list.

Regards,
        Goran
