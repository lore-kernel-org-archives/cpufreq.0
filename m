From: Georg Sauthoff <g_sauthoff@web.de>
Subject: Re: Pentium M and 2.4. kernel: does not work
Date: Mon, 18 Aug 2003 20:51:41 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200308182051.41707.g_sauthoff@web.de>
References: <200308160043.30649.g_sauthoff@web.de> <200308172309.04569.g_sauthoff@web.de> <20030818175051.GA1570@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030818175051.GA1570@brodo.de>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@brodo.de>
Cc: cpufreq@www.linux.org.uk

On Monday 18 August 2003 19:50, you wrote:

> Yes it did. Indeed no cpufreq driver got properly loaded -- a bug in
> speedstep-centrino prevented this. Can you try the attached version,
> please?

Sure, no problem:

# /proc/cpufreq
          minimum CPU frequency  -  maximum CPU frequency  -  policy
CPU  0       600000 kHz ( 46 %)  -    1300000 kHz (100 %)  -  performance
# echo -n "0%0%100%userspace" > /proc/cpufreq
# cat /proc/cpufreq
          minimum CPU frequency  -  maximum CPU frequency  -  policy
CPU  0       600000 kHz ( 46 %)  -    1300000 kHz (100 %)  -  userspace
# cat /proc/sys/cpu/0/speed
1300000
# cat /proc/sys/cpu/0/speed-min
600000
# cat /proc/sys/cpu/0/speed-min > /proc/sys/cpu/0/speed
# cat /proc/sys/cpu/0/speed
600000

So it seems to work now.

A 'speed rsa' in openssl is nearly perfectly about a factor of 2 slower in 
min-speed in comparison to max-speed. Like it should be! At max-speed the fan 
turns on and and min-speed not (while openssl ist testing).

Great.

Regards
Georg Sauthoff
