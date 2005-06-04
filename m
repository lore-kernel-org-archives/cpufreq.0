From: Fredrik Eriksson <fredrik.eriksson@mudsphere.net>
Subject: speedstep_smi module loads randomly.
Date: Sun, 5 Jun 2005 00:50:32 +0200
Message-ID: <200506050050.32815.fredrik.eriksson@mudsphere.net>
References: <42A20FCF.4070904@neggie.net>
Reply-To: fredrik.eriksson@mudsphere.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <42A20FCF.4070904@neggie.net>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

this is not a real issue since its working.. but i wanted to know why it does 
like this:

root@sajkisen:/home/sajko> modprobe speedstep_smi
FATAL: Error inserting speedstep_smi 
(/lib/modules/2.6.11-sr5/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-smi.ko): 
No such device
root@sajkisen:/home/sajko> modprobe speedstep_smi
FATAL: Error inserting speedstep_smi 
(/lib/modules/2.6.11-sr5/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-smi.ko): 
No such device
root@sajkisen:/home/sajko> modprobe speedstep_smi
FATAL: Error inserting speedstep_smi 
(/lib/modules/2.6.11-sr5/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-smi.ko): 
No such device
root@sajkisen:/home/sajko> modprobe speedstep_smi
FATAL: Error inserting speedstep_smi 
(/lib/modules/2.6.11-sr5/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-smi.ko): 
No such device
root@sajkisen:/home/sajko> modprobe speedstep_smi
root@sajkisen:/home/sajko> 


fyi i havent done anything in another terminal or anything while ive tried to 
load it... ive just spammed 4-5 times the up arrow and pressed enter :P

its wierd since it also takes from 1st attempt to 5 attempts to make it insert 
the module. just thought someone seen it before and know what to do to fix it 
(since when im doing it in modules.conf it returns the same error thus not 
loading the module when i boot my laptop :P)
