From: Gabriele Ferri <fif3336@iperbole.bologna.it>
Subject: geode sc1100 gx-suspmod module
Date: Fri, 01 Jun 2007 17:44:25 +0200
Message-ID: <1180712665.46603ed97f1d0@webmail.iperbole.bologna.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Cpufreq@lists.linux.org.uk

Hi list!

I've recently assembled a "wrap board" pc ( http://www.pcengines.ch/wrap.htm ),
it uses an AMD SC1100 cpu (
http://www.amd.com/us-en/ConnectivitySolutions/ProductInformation/0,,50_2330_9863_10524%5E10525,00.html
). Since this processor is based on the GX design, I hope to be able to use the
gx-suspmod module to reduce power consumption and heat production.

Every time I issue "modprobe gx-suspmod" I get a "FATAL: Error inserting
gx_suspmod - no such device" error. This happens both with a Debian 2.6.28
kernel and with a custom-compiled 2.6.22 rc2 kernel.

Another slightly offtopic but related question: I've read in the product brief
for the SC1100 cpu that it has "ACPI 1.0 compliant power management". When
linux boots the kernel complains that it cannot find any acpi table. Should I
load a custom table via the kernel? This way I will be able to get some basic
power management?

many thanks for your patience with such a newbie
cheers

Gabriele
