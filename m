From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: patch doesn't apply cleanly on 2.4.22
Date: Tue, 16 Dec 2003 20:23:20 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031216192320.GF14031@poupinou.org>
References: <20031215183708.GA656@kukaracha.sotano>
	<1071516958.30492.64.camel@dell.linux.box>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1071516958.30492.64.camel@dell.linux.box>
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
To: AthlonRob <AthlonRob@axpr.net>
Cc: cpufreq@www.linux.org.uk

On Mon, Dec 15, 2003 at 11:35:58AM -0800, AthlonRob wrote:
> On Mon, 2003-12-15 at 10:37, paul wisehart wrote:
> 
> > I have this patch: cpufreq-LINUX_2_4-20031212.tar.bz2
> > It won't patch cleanly onto a stock kernel.org 2.4.22 kernel-source.
> > 

Paul: I don't remember exactly when the merge to 2.4.23 was done (look at
the cpufreq archive, or use cvs log facility), but I think that
cpufreq-LINUX_2_4-20031208.tar.bz2 is against 2.4.22.

> > Before I get any further, can someone verify that this patch is for 2.4.22, or
> > should I be using 2.4.23(, or something else?)?
> 
> Hey Paul-
> 
> I'm about 95% certain that patch isn't for 2.4.22... it's going to
> either be for 2.4.23 or for 2.4.24-pre1.  My money is on 2.4.23.

You win ;)

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
