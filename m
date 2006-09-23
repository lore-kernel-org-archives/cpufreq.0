From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: writing a cpufreq driver
Date: Sat, 23 Sep 2006 17:31:57 +0200
Message-ID: <20060923153157.GS4945@poupinou.org>
References: <45140FFC.1060305@slagter.name>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <45140FFC.1060305@slagter.name>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Erik Slagter <erik@slagter.name>
Cc: Cpufreq@lists.linux.org.uk

On Fri, Sep 22, 2006 at 06:31:56PM +0200, Erik Slagter wrote:
> > I'm now sure the southbridge is throttling the processor...
> 
> I was always told that throttling the processor doesn't yield any
> powersaving? And that is exactly what my last two motherboards show.

In fact this depend if frequency and 'performance for a given task' is
linear or not.  On older systems (as the one from the OP) there
is an huge performance penalty (external L2 cache if even there is one)
when running at full.  Throttling the processor can then achieve
power saving.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
