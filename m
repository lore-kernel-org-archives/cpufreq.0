From: Tom Bruno <crweb@vwords.com>
Subject: cpu won't stay in powersave mode
Date: Mon, 15 Dec 2003 01:17:25 +0000
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <1071451044.4757.9.camel@localhost>
Reply-To: crweb@vwords.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

I'm in the process of writing an acpi daemon that will also take care of
cpufreq settings.

I have found that unless I set
/sys/device/system/cpu/cpu0/cpfreq/scaling_governer
  to powersave from the command line that /proc/cpuinfo will not change
and the speed will not stay at powersave speeds. 

With other programs like cpufreqd, using a cpu speed test posted on this
list, i have found that the cpu speed does indeed change even though
/proc/cpuinfo does not. 
 
However, i have found that after about 8-10 seconds the cpu test starts
reporting that the cpu is back to full speed even though the powersave
value is still in scaling_governer.

Like i said above if I change it via hand using echo, /proc/cpuinfo is
correct, and the cputest reports the correct speed constantly.

performance mode: 2.4ghz
powersave mode: 1.2ghz
Intel P4-M 2.4ghz
Dell Inspiron 8500 - Bios A05
kernel-2.6.0-test11


-- 
Vwords.com Technology Services
 PC and Network Services for Southern Illinois
  Phone: 618-713-6896
