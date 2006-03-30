From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6300] 2.6.16
Date: Wed, 29 Mar 2006 16:18:36 -0800
Message-ID: <200603300018.k2U0IamU003788@fire-2.osdl.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=6300





------- Additional Comments From simon@cesa.cz  2006-03-29 16:18 -------
Created an attachment (id=7718)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=7718&action=view)
output of cat /sys/devices/system/cpu/cpu*/cpufreq

... this is output from new kernel .... i compile governors and driver
speedstep-ich as module ...

when driver speedstep_ich is loaded second suspend crashed 
when i make before suspend -> rmmod -f speedstep_ich, speedstep_lib and
governors -> second suspend work OK 


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
