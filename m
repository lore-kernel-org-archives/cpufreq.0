From: Dominik Brodowski <linux@brodo.de>
Subject: Re: How to control the speed?
Date: Mon, 23 Jun 2003 15:53:40 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030623135340.GG2330@brodo.de>
References: <200306230047.09481.snowfire@blueyonder.co.uk>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200306230047.09481.snowfire@blueyonder.co.uk>
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
Content-Transfer-Encoding: 7bit
To: Edward Macfarlane Smith <snowfire@blueyonder.co.uk>
Cc: cpufreq@www.linux.org.uk

On Mon, Jun 23, 2003 at 12:47:09AM +0100, Edward Macfarlane Smith wrote:
> I'm writing a little graphical utility to allow you to specify the default 
> speed when switching between AC and battery, and also the screen brightness.
> At the moment it's specifically for my Sony Z1SP, so it will probably end
> up a mix of ACPI/cpufreq/sonypi.
>
> Currently I've got the screen brightness working as it can make some ioctl
> calls to /dev/sonypi. 
>
> I was wondering if there are any ioctls for setting the speed using cpufreq 
> or should I just open "/proc/cpufreq" and write a string to it?. I'd also
> like to know how to read the possible speeds, again in an ioctl.

In 2.5., this is easily possible [scaling_available_frequencies in the
corresponding sysfs directory], for 2.4., there is no such file but one of
the cpufreq daemons has some code in it to detect the speeds nonetheless.

All interfaces to cpufreq are either /proc files - sysctl's [sort of
deprecated] or sysfs files [2.5. only, though]

	Dominik
