From: Roberto Gordo Saez <roberto.gordo@gmail.com>
Subject: Re: Voltage tweaking in powernow_k8
Date: Mon, 16 Apr 2007 17:25:52 +0200
Message-ID: <46239583.67d3ffa6.271c.2ed5@mx.google.com>
References: <20070415171810.GA3096@thing.nowhere>
	<1449F58C868D8D4E9C72945771150BDF02076D07@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:date:from:to:subject:references:mime-version:content-type:content-disposition:in-reply-to:user-agent:message-id;
	b=WTZaNRa5rWJlXLdPk5/Zy57Klk38rwxNQPSOdgpGidphh/fU+DvMvv46LPHYfY/yjMP7iHaPDo6ecf09wDGl001bkF6Z+Oa+ZFFQb9N4zcaR1gob93eeyiyhWZ5cevK3Zmrslsz1Upk0FVqJcwlAVpXw5lek+xNTFTJDk+6tuBM=
Content-Disposition: inline
In-Reply-To: <1449F58C868D8D4E9C72945771150BDF02076D07@SAUSEXMB1.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>, cpufreq@lists.linux.org.uk

On Mon, Apr 16, 2007 at 08:55:38AM -0500, Langsdorf, Mark wrote:
> AMD policy is that the ACPI values must be used.  I
> can't support a patch that overrides the ACPI values.
> 
> I have no objection to it being in the code, but I
> can't support it.

Hi, thanks for replying.

I understand your position about this. Please, correct me if I'm
giving a wrong interpretation to your message; in the way I read it,
you are unable to support those changes (because of your position at
AMD you are required to strictly follow the policy), but you could
live with those changes provided that your name is not attached to
them...

Admittely, it is not such an elegant solution, but people are indeed
doing other hacks anyway, like statically overriding the ACPI table
with a hacked DSDT at kernel compile time (distributions like gentoo
have HOWTOs for this). I'm not sure if this would be a preferred
approach, but it does look even uglier to me. If you have any
suggestion or alternative proposal, I would be interested in your
opinion.

It may be a good idea to print warnings when the parameter is used,
to clearly state the unsupported and potentally dangerous effect of
the parameter (though it would not be enough to change your view,
I guess...).
