From: Vladimir Vanyukov <vze2b36z@verizon.net>
Subject: Need HELP
Date: Wed, 23 Jul 2003 16:46:14 -0400
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <3F1EF416.6020102@verizon.net>
Reply-To: VladAtNYC@usa.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: CPUFreq <cpufreq@www.linux.org.uk>

Hey,
    I am using the WOLK 4.3 patchset and cpufreq seems to be working 
fine except for 2 problems. the /pro/sys/cpu interface seems to be 
broken, the speed-max and speed-min are both always 0, also i cannot 
change cpu frequency by writing to /proc/sys/cpu/0/speed and speed only 
correctly (at least i think its a correct value) displays the speed 
after i write something to /proc/cpufreq. The other problem is that i 
think the policy setting in /proc/cpufreq is broken, when it is set to 
performance it simply sets the speed to the the maximum and keeps it 
there and when on powersave is simply sets the speed to the minimum and 
keeps it there. Any help would be great, thanx.
