From: Edward Macfarlane Smith <snowfire@blueyonder.co.uk>
Subject: How to control the speed?
Date: Mon, 23 Jun 2003 00:47:09 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200306230047.09481.snowfire@blueyonder.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
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
To: cpufreq@www.linux.org.uk

I'm writing a little graphical utility to allow you to specify the default speed when switching between AC and battery, and also the screen brightness. At the moment it's specifically for my Sony Z1SP, so it will probably end up a mix of ACPI/cpufreq/sonypi.
Currently I've got the screen brightness working as it can make some ioctl calls to /dev/sonypi. 
I was wondering if there are any ioctls for setting the speed using cpufreq or should I just open "/proc/cpufreq" and write a string to it?. I'd also like to know how to read the possible speeds, again in an ioctl.
Currently I've just got scripts that get run by acipd.
e.g.
mains_power() {
        states=`gawk "/count/ { print \\$3 }" /proc/acpi/processor/CPU0/performance`
        ((states--))
        min_speed=`gawk "/P$states/ { print \\$2 }" /proc/acpi/processor/CPU0/performance`
        max_speed=`gawk "/P0:/ { print \\$2 }" /proc/acpi/processor/CPU0/performance`
        echo -n 0:$min_speed"000:"$max_speed"000:performance" > /proc/cpufreq
        spicctrl -b 255
}

btw I'm trying to get this working on a 2.4 series kernel. I'm currently using 2.4.21-ac1 with the extra back port patch I sent last week so that cpuinfo reports the right stuff.
It may all be documented really well somewhere but I haven't found it yet, so if someone could point me in the right direction that would be much appreciated.
Once I get something useful I'll make it available to anyone (so far only the slider for brightness works!) who wants it.
Regards,
Edward
