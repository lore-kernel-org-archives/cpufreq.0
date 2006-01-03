From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: cpufreq: powernow-k8 frequency transitions question
Date: Tue, 3 Jan 2006 17:29:46 +0100
Message-ID: <20060103162946.GF13887@poupinou.org>
References: <84EA05E2CA77634C82730353CBE3A84303D430BD@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84303D430BD@SAUSEXMB1.amd.com>
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
To: "Devriendt, Paul" <paul.devriendt@amd.com>
Cc: Gunter Ohrner <G.Ohrner@post.rwth-aachen.de>, cpufreq@lists.linux.org.uk

On Mon, Jan 02, 2006 at 11:37:12AM -0600, Devriendt, Paul wrote:
> > I found safety guards which return an error if an invalid frequency
> > transition ("lo-lo transition") is requested.
> 
> Transitions between low frequencies (<=1.4GHz) are not supported by
> hardware. The way to do them is to transition to an intermediate
> high frequency. No BIOSs define two low PStates so the case never
> occurs, but it could theoretically be done. The AMD BIOS and Kernel
> Developers Guide available on AMD's web site provides more information
> on K8 PStates.

I'm wondering if this would have some more power saving if there are more
low p-states.  I should some day look at this more seriously.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
