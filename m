From: David Pottage <david@chrestomanci.org>
Subject: Re: cpufreq on Debian, problems
Date: Sun, 11 Mar 2007 21:20:02 +0000
Message-ID: <45F47282.4020209@chrestomanci.org>
References: <553837380703111304m4aea8cbcufdc5da4261e41895@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <553837380703111304m4aea8cbcufdc5da4261e41895@mail.gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Joshua Justice <joshj777@gmail.com>, cpufreq@lists.linux.org.uk

Joshua Justice wrote:
> I'm running a Pentium 4, 3.40 gigahertz, on Debian Etch 2.6.18-4-686, 
> and I
> have issues with overheating because cpu throttling isn't working.
Is your clock frequency scaling back when your system is not under load?

If it is not, and you want it to, then you need to run the ondemand or 
conservative govenor. Take a look in 
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors that 
they are there, then echo a govenor name into 
/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

If the clock frequency is changing acording to your system load, but it 
is still overheading, you probably need to improve your cooling hardware.

If it is not practical to improve your CPU cooling, or if your peak 
loads are ocasional, then you can prevent overheating by limiting the 
CPU temperature. I have written a userland perl script that does this 
automaticaly, by monitoring the CPU temperature, and lowering the 
maximum CPU frequency if the temperature gets to high. You can have a 
copy if you like.

-- 
David Pottage
