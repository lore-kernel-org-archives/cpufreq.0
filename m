From: Viktor Radnai <efti@gotiao.com>
Subject: Re: Dell Inspiron 8200
Date: Sun, 09 Nov 2003 22:03:35 +1100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3FAE1F07.5020305@gotiao.com>
References: <20031107145510.GH2750@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20031107145510.GH2750@pengutronix.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robert Schwebel <robert@schwebel.de>
Cc: cpufreq@www.linux.org.uk

I had that problem before with my Dell Inspiron 4150. I was using an 
older (late 2.5 iirc) kernel. I've found that the ACPI frequency scaling 
driver was crashing on startup and my 2GHz Pentium 4M was running at 
700MHz (which could be a BIOS default for saving power, maybe?).

In any case, it would be useful if you could tell us what cpufreq 
related settings you configured in your kernel, and any related output 
from dmesg. It's no point speculating without more information.

Regards,
Vik

Robert Schwebel wrote:
> Hi, 
> 
> I just tried 2.6.0-test9 on my Dell Inspiron 8200 Laptop with Debian
> unstable; it seems like I don't get the full speed any more. The system
> has a 1.7 GHz Mobile P4, but /proc/cpuinfo only shows 1196.593 MHz (cpu
> MHz). Any idea what I could try? 
> 
> Robert
