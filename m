From: Marcin =?iso-8859-2?q?Ka=B3u=BFa?= <mk@sekretarka.no-ip.org>
Subject: help on nforce2 module - strange things happening
Date: Mon, 14 Jun 2004 19:03:22 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200406141903.22656.mk@sekretarka.no-ip.org>
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

Hello
I'm working on that NForce2 cpu fsb changing and I have encountered a strange 
problem:

When I set the registers from a userspace program (fsbd) (on going through 
181-180MHz and back)it works if only the system is idle - in fact it works 
when cpu only is loaded i.e. by cpuburn, but it crashes on hdd activity (I'm 
running rpmbuild for a test).

I rewrote the code so that I could use it for both the program and Sebastian's 
cpufreq module and a strange thing happens - when I go down from 181 to 180, 
it sets the registers and it's ok, but when I go back and the registers 
should be set again it crashes whatever the system condition is.

Can anybody help me and tell my what might be happening there differently that 
causes the code to behave differently in kernelspace and userspace, or what 
should I try to do? The wierd thing is that it's exactly the same code (the 
only difference are commands to talk  to pci). Or just a hint where to ask.

The code is here:
http://dynamic-oc.sourceforge.net/nforce2/
Sebastian's code is modified only to call my functions. All the regs changing 
is done in a loop in nforce2_write_regs.
(I know the code is a bit messy and sorry for that - when it's stable I'll 
clean it up of course)

Cheers,
Martin
