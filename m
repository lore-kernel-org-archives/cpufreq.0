From: "Chris Freyer" <chris@thefreyers.net>
Subject: Repost:  System freeze running powersaved.
Date: Wed, 05 Jan 2005 18:34:26 -0500
Message-ID: <E1CmKfa-000Jhs-Bt@server2.anyname.com>
Reply-To: Chris@TheFreyers.net
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hello all.

I'm having an issue with a new "silent PC" that I built.  I installed 
SuSE 9.2 Pro without any problems.  But after each reboot, my machine 
locks up within 10 minutes.  Logs didn't provide any meaningful info, 
but there *are* ACPI messages in it.  I googled and learned that 
powersaved might be causing the problem, so I removed it with insserv -
r powersaved, and now it runs fine.  Nearly 2 weeks uptime now.

I'm a little confused about how to resolve this.  What is the 
relationship between powersaved and acpid, apmd, cpufreqd, etc...?  
Which ones do I need?  

FYI:  I have a VIA C3 processor, VIA chipset, and VIA video.  Similar 
in function to a VIA EPIA motherboard, but made by Matsonic.

Any assistance is appreciated.
Chris
