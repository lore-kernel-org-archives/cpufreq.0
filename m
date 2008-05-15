From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] Remove p4_clockmode driver
Date: Thu, 15 May 2008 12:55:22 +0200
Message-ID: <20080515105522.GB8015@dominikbrodowski.net>
References: <1209844030.13290.5.camel@linux-2bdv.site>
	<20080511161934.GI15445@codemonkey.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20080511161934.GI15445@codemonkey.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq <cpufreq@lists.linux.org.uk>, mzahor@dtech.sk

Dave,

On Sun, May 11, 2008 at 12:19:34PM -0400, Dave Jones wrote:
>   So whilst killing this off is probably the right thing to do, there may be
>   some value in parts of it living on in the ACPI code ?

if it indeed gets ripped out of the kernel code[*], a good place to keep it
is in cpufrequtils, where one working and one broken external debug module
are kept at the moment.

Best,
	Dominik


[*] even though it was the very first cpufreq driver which existed, as the
hardware I used back then had no proper frequency scaling...
