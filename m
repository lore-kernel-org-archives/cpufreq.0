From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: 2.4.21 Isn't working for me....
Date: Tue, 26 Aug 2003 13:29:48 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030826112948.GF10585@poupinou.org>
References: <1061872616.27076.47.camel@localhost>
	<20030826064747.GE10585@poupinou.org>
	<3F4B27D6.1000700@wanadoo.fr> <3F4B2E18.9070006@basmevissen.nl>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F4B2E18.9070006@basmevissen.nl>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bas Mevissen <ml@basmevissen.nl>
Cc: Toula Michael <keos@wanadoo.fr>, cpufreq@www.linux.org.uk

On Tue, Aug 26, 2003 at 11:53:28AM +0200, Bas Mevissen wrote:
> Toula Michael wrote:
> 
> >
> >Do the 2.4.22 patch works with linux.2.4.22 final or only with -rc ????
> >Cheers,
> >
> 
> final is rc4 + makefile patch
> rc4 is small delta upon rc3
> 
> So rc3, rc4 and final probably patch without rejects and rejects with 
> older versions are likely easy to fix. But if there is no real reason to 
>  use something before 22, please use 2.4.22.
> 

To be more precise: this is cpufreq-2.4.22-pre6 from Dave J. (and containing
lot of updates from Dominik) found in http://www.codemonkey.org.uk/
with some portions rediffed against 2.4.22-rc4 (which is 2.4.22 in fact).

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
