From: Marcin =?iso-8859-2?q?Ka=B3u=BFa?= <mk@sekretarka.no-ip.org>
Subject: more on NForce2
Date: Fri, 11 Jun 2004 23:24:19 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200406112324.19229.mk@sekretarka.no-ip.org>
Reply-To: mk@sekretarka.no-ip.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Hi
	I recently did some research on the chipset and I've found the way to change 
FSB in full range - however another problem occured.
	So what I've found out is that the chipset is reconfigured by BIOS on going 
through 115,149,182,215 MHz which makes sense since it divides the 
frequencies into 5 bands around 100,133,166,200,233 MHz frequencies in the 
center.
	So what I did is dumped the PCI config space each time, got diffs and a table 
of configurations of 27 registers that change for each band (as well as each 
CL, since changing CL causes many registers to change, while other timing 
parameters all sit in the 0:0.1 0x90.L reg - any idea why it is so??).
	On my board (EPOX RDA3i) the situation was following:
if I booted anywhere from 182 and up, the 200 configuration was used and when 
I got down to 166 it crashed (different thing was when going up - reaching 
233 didn't cause a crash, but on the other hand only few regs are changed 
when going through 215 whereas on crossing 182 all of them  27 change).
	However when I reconfigure the registers each time I change 'bands' I can get 
down to 100 MHz with almost no problems. There is only one - this can be done 
only when the system is idle. When something is going on (rpmbuild was 
running) the system crashes when I write the registers :(. There was no crash 
when I suspended the program, changed fsb/regs and resumed it - then 
everything was fine. Any ideas on how to solve this? (my first thought was to 
disable irq's and do all the things that are done in kernel modules when they 
'need to be alone for some time' and must not be disturbed, but I'm not very 
good at kernel modules yet and I don't really know what they are - any 
suggestions?? )
	Here's the program that does it. 
http://dynamic-oc.sourceforge.net/nvfsb-0.1.tgz
 Can anyone with nf2 run it to check if the config tables work for him (and 
send the prog output if they don't)? On init the program tries to determine 
what settings the system is running at by matching any of coniguration sets.
If it doesn't find the exact match, it chooses the most probable and then 
displays the regs that differ (and doesn't allow any changes for safety). The 
only register I know of that it may complain about is 0:0.1 90.W when there's 
8xxx instead of 0xxx - just change the T(RAS) in BIOS to an even number.
Thanks for any advice
Martin
