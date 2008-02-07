From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH][retry] Allow Powernow-k8 to use _PSD
Date: Thu, 7 Feb 2008 20:47:21 +0100
Message-ID: <200802072047.22344.rjw@sisk.pl>
References: <200802071246.44728.mark.langsdorf@amd.com>
	<20080207191405.GA20383@codemonkey.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20080207191405.GA20383@codemonkey.org.uk>
Content-Disposition: inline
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
Cc: cpufreq@lists.linux.org.uk

On Thursday, 7 of February 2008, Dave Jones wrote:
> On Thu, Feb 07, 2008 at 12:46:44PM -0600, Mark Langsdorf wrote:
>  > The ACPI _PSD structure indicates which processors share frequencies.
>  > Provide support for powernow-k8.c to use this function.
>  > 
>  > This was included in the 2.6.23-mm series but dropped from 2.6.24
>  > and is being resubmitted.
> 
> Hi Mark,
> 
> It was dropped because it caused regressions on some systems.
> (I sent you mail about this last month when it got dropped, but I don't
>  think I saw a reply?)
> Rafael (CC'd) saw the problem and narrowed it to this specific patch.

Yes, it broke suspend on my hp nx6325.

Thanks,
Rafael
