From: Matt Wright <matt@consultmatt.co.uk>
Subject: Mobile Athlon 4 2200+
Date: 21 Sep 2003 23:03:30 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1064181810.2835.6.camel@riogrande>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Hi,

Finally managed to get a solution to powernow-k7 not working on my PC. I
modified x86info (1.12b i think) to display all of my PST tables, along
with the CPUID and max freq and voltage. (Found the patch on a mailing
list somewhere) I discovered that one of the PST tables matched my CPU
speed settings and the MV and MV of the CPU. It simply had a cpuid of
0x781 not 0x7a0 (that my CPU has). I modified powernow-k7.c so that when
it scanned for PST tables it changed "etuple" to 0x781 if it was 0x7a0.
Once that was done the module succesfully dumped a decent PST table and
it works perfectly.

Thanks for all your help people,

Matt
