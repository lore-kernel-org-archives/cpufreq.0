From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Throttling vs. idling
Date: Sat, 11 Sep 2004 20:28:45 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040911182845.GB8527@dominikbrodowski.de>
References: <20040911125247.468CE3F04@latitude.mynet.no-ip.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040911125247.468CE3F04@latitude.mynet.no-ip.org>
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
Content-Transfer-Encoding: 7bit
To: aeriksson@fastmail.fm
Cc: cpufreq@www.linux.org.uk

On Sat, Sep 11, 2004 at 02:52:46PM +0200, aeriksson@fastmail.fm wrote:
> 
> Hi there,
> 
> I have this old laptop which can do 500 or 700 MHz. Unfortunately its 
> acpi stuff is broken so it gets overheated and powers off under heavy 
> & log compiles. However, I can access and use the throttling 
> manually...
> 
> Now the question. Suppose I want to leave it on with light load 
> (fetchmail every 5 mins). Would forcing throttling make it colder/
> consume less power than would the normal idle loop? Normally I run it 
> om apm mode to avoid the power offs, se I'm really comparing 
> 
> 1) idle loop on apm mode, with 500MHz, and
> 2) idle loop on acpi, heavily throttled, with 500MHz.
> 
> Would 2 be a win?

As I suppose that the "idling" doesn't work well on your system, throttling
might indeed be an option. Usually, energy consumption of a CPU being
throttled is [while it is throttled] approximately equal to C2 idling, IIRC,
so if C2 works and the CPU load is lower than (1 - throttling_pctg),
throttling won't get you anything. If C2 doesn't work, though, throttling
may help.

	Dominik
