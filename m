From: "Chris Pemberton" <cjpembo@gmail.com>
Subject: Re: Use proc or sysfs with cpufrequtils
Date: Fri, 4 May 2007 12:01:07 -0500
Message-ID: <ccc103cf0705041001h3588e79cr61ec9d403679a07b@mail.gmail.com>
References: <463A9B18.9020200@gmail.com>
	<1178288133.1231.908.camel@queen.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=hIk2Lsva1T9wFBUwT/FzYXUJalgbdr8EaBgnGO62ptn4SduungYdZ0gJnUMCHiYX/O2Gln/Hv4hJ2eX1wHRk6/Z8pJ2sZs+SqHm7EWQvI3MeLAT/TAHWOTi26Mue6EIIBYYr0XI4xh/Tgp+qRSLE2yxIhEXatnrsiiPSQjRvba0=
In-Reply-To: <1178288133.1231.908.camel@queen.suse.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: trenn@suse.de
Cc: cpufreq@lists.linux.org.uk

On 5/4/07, Thomas Renninger <trenn@suse.de> wrote:
> On Thu, 2007-05-03 at 21:31 -0500, Chris Pemberton wrote:
> > Hello,
> >
> > I'm compiling cpufrequtils from scratch.  My kernel contains ACPI/proc
> > support only (not ACPI/sysfs).
> >
> > 1.  Why does the kernel state that ACPI/sysfs depreciated while
> > cpufrequtils states that ACPI/proc is depreciated?
> >
> > 2.  Can you enable both ACPI/sysfs and ACPI/proc in the kernel without
> > any issues?
> >
> > 3.  Does this list have a searchable webpage?
>
> > http://lists.linux.org.uk/mailman/listinfo/cpufreq
>
> You can just download some monthly archives, feed your mailer with it
> and search for things?
>
> Some days ago I thought it's down or broken, but this came out to be an
> opera (9.10) problem, I still get:
> You tried to access the address
> http://lists.linux.org.uk/mailman/listinfo/cpufreq, which is currently
> unavailable...
>
> firefox is working.
>
>    Thomas
>
>

Thank you.  I found the following:

http://www.intel.com/cd/ids/developer/asmo-na/eng/195910.htm?page=1

A great explanation.
