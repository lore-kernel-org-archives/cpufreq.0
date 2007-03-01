From: Thomas Renninger <trenn@suse.de>
Subject: ondemand as default governor
Date: Thu, 01 Mar 2007 18:41:54 +0100
Message-ID: <1172770914.10619.587.camel@d36.suse.de>
Reply-To: trenn@suse.de
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq <cpufreq@lists.linux.org.uk>

I just read in drivers/cpufreq/Kconfig:

# Note that it is not currently possible to set the other governors
(such as ondemand)
# as the default, since if they fail to initialise, cpufreq will be
# left in an undefined state.

Is this a bigger problem to solve?
Is there already someone working/thinking on/about a solution?

Allowing this would be convenient...

Thanks,

   Thomas
