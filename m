From: Harald Milz <milz@seneca.muc.de>
Subject: powernow-k7 for XP-M 2400+ CPU
Date: Wed, 26 May 2004 00:50:07 +0200 (CEST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040525225007.2DCE949C52@nathan.muc.de>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi,

could any kind soul please send me the powernow-k7 output for his Athlon
XP-M 2400+ CPU (cpuid 0x7A0)?

Background: my Asus A7V8X BIOS does not support Athlon mobile CPUs (and
probably never will). But it is fairly easy to modify powernow-k7 in a
way to set the PST data on the module command line, fill a fake struct
pst accordingly and get a working setup. This could be a workaround for
all the people who run mobile CPUs on desktop boards or broken notebook
BIOSes and would like to save some power. OK we will not be able to set
the voltage but setting the clock rate would help anyway. Collecting PST
data for various cpuids would help here BTW. 

Remark: my Asus board w/ BIOS 1014 (latest) recognizes the CPU as an Athlon
MP 1800. Duh. So the powernow and acpi modules do not get any chance to do
anything because they don't get advertised a mobile CPU.

Yes, I am doing this on my own risk, but as long as you don't overclock
there should be no problem at all. Be sure the patch will contain a
warning in capital letters not to use this feature for overclocking...

Ciao,
hm

-- 
F u cn rd ths u cnt spl wrth a dm!
