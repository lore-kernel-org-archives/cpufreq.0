From: Dominik Brodowski <linux@brodo.de>
Subject: Re: dumb question from curious newbee.
Date: Fri, 20 Jun 2003 19:44:37 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030620174437.GB1889@brodo.de>
References: <1056093725.15596.2.camel@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1056093725.15596.2.camel@localhost>
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
To: Japie <japie@scarlet.nl>
Cc: cpufreq@www.linux.org.uk

On Fri, Jun 20, 2003 at 09:22:05AM +0200, Japie wrote:
> Hello,
> 
> Here's the dumb question; Is my AMD Duron with VIA-KT133 capable of
> freq. stepping? (to reduce temp. in my server.)

No, there's no frequency scaling for AMD Duron. But maybe throttling (power
consumption is reduced linear to processing power) is available - try out
ACPI [http://acpi.sf.net for more information]

	Dominik
