From: Rob Weryk <rjweryk@uwo.ca>
Subject: Re: [PATCH] cpufreq: allow ondemand governor as default
Date: Sun, 06 Mar 2005 18:02:57 -0500
Message-ID: <20050306230257.GA6894@aquarid.physics.uwo.ca>
References: <20050304011359.GA32684@aquarid.physics.uwo.ca>
	<20050306170625.GA2034@isilmar.linta.de>
	<20050306215106.GA25034@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
In-reply-to: <20050306215106.GA25034@redhat.com>
Content-disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@ZenII.linux.org.uk, Dominik Brodowski <linux@dominikbrodowski.net>

On Sun, Mar 06, 2005 at 04:51:06PM -0500, Dave Jones wrote:
> On Sun, Mar 06, 2005 at 06:06:25PM +0100, Dominik Brodowski wrote:
> 
>  > This is not possible yet -- unfortunately. If you set ondemand to be
>  > "default" but it fails at initialization (it does so for several drivers!),
>  > cpufreq enters an undefined state
> 
> I knew there was a reason for declining this, but couldn't recall
> what it was (hence I sent Rob to the list when he sent me the patch).

Hi Dominik and Dave, thanks for letting me know.

> This has come up about 4-5 times now in the last month or two.
> Maybe its worth adding a comment to the Kconfig to prevent a 6th time :-)

How about the patch below?  I initially tried to add it as a help
item, but those don't show up (at least not in make menuconfig)

Signed-off-by: Rob Weryk <rjweryk@uwo.ca>

--- linux-2.6.11/drivers/cpufreq/Kconfig	2005-03-06 17:25:06.000000000 -0500
+++ robbie-2.6.11/drivers/cpufreq/Kconfig	2005-03-06 17:58:55.000000000 -0500
@@ -52,6 +52,10 @@
 	  This option sets which CPUFreq governor shall be loaded at
 	  startup. If in doubt, select 'performance'.
 
+# Note that it is not currently possible to set the other governors
+# as the default, since if they fail to initialise, cpufreq will be
+# left in an undefined state.
+
 config CPU_FREQ_DEFAULT_GOV_PERFORMANCE
 	bool "performance"
 	select CPU_FREQ_GOV_PERFORMANCE
