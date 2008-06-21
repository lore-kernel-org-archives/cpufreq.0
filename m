From: Achim Gottinger <achim@ag-web.biz>
Subject: Adding devices to ...system/cpu/cpuX/cpufreq from other modules
Date: Sat, 21 Jun 2008 08:34:16 +0200
Message-ID: <485CA0E8.4010109@ag-web.biz>
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

Hi developers,

I'm working on a specialiced version of powernow-k8 for phenom 
processors here. On these cpu's it is possible to modify the multis and 
voltages for the p-states by changing the associated msr registers.
First i stripped down powernow-k8 and removed all the <k10 stuff. Then i 
modified the initialisation function to use the p-state msr registers 
and not the acpi tables to populate the cpufreq table. I also had to 
change the acpi table to use higher that stock multis.
Currently i use a separate module to modify the msr registers. It uses 
it's own substyem and has devices for each vid did and fid of each cores 
p-states.
I'd like to move this functionality into my powernow module but since 
i'm new to kernel coding i don't know how to add the devices to
/sys/devices/system/cpu/cpu0/cpufreq. I'd be glad if someone can post a 
small code snippet or a reference to an module which does this.

greets
achim~
