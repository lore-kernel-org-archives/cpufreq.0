From: Damien Marchal <marchal@lifl.fr>
Subject: my dothan didn't work with cpufreq...
Date: Mon, 12 Jul 2004 22:54:35 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <40F2FA8B.10307@lifl.fr>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Hi,

I have a problem to use cpufreq with my Dothan based computer. During 
initialisation i get the following message:

speedstep-centrino: found unsupported CPU with Enhanced SpeedStep: send 
/proc/cpuinfo to Jeremy Fitzhardinge <jeremy@goop.org>

What I did. As i received no feedback I look inside the cpufreq 
sourcecode that throw the error and I tried to fixed it myself. I 
compared it with the content of my /proc/cpuinfo:

cpu family      : 6
model             : 13
model name   : Intel(R) Pentium(R) M processor 1.50GHz
stepping        : 6
cpu MHz         : 1500.834
cache size      : 64 KB

I located a correct cpu_id cpu_id_dothan_b0 but I wasn't able to locate 
were is it used (it  seems to differ from the banias  code).

In addition in the centrino_cpu_init_table(struct cpufreq_policy 
*policy), the loop that detect the processor failed as my processor 
string contains 1.50Ghz and not 1500Mhz (maybe an issue related to my 
Asus BIOS).

In fact, I could try to make a patch for making my processor accepted by 
the centrino checking code, but after this I ignore what will happend as 
no predefined tables frequency/voltage exists like with the Banias. Will 
it burn my computer :) or will it nicely use acpi/ich4 in some way ?

Cheers,
Damien Marchal.
