From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k8 problem
Date: Mon, 14 Mar 2005 19:14:58 +0100
Message-ID: <20050314181458.GI2298@poupinou.org>
References: <84EA05E2CA77634C82730353CBE3A843021DDF84@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A843021DDF84@SAUSEXMB1.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Devriendt, Paul" <paul.devriendt@amd.com>
Cc: cpufreq@ZenII.linux.org.uk

On Mon, Mar 14, 2005 at 11:44:53AM -0600, Devriendt, Paul wrote:
> As for having the driver calculate a correction factor based
> on by how much you are overclocking the part ... this is somewhere
> AMD does not want to go. Besides, I am not sure how the driver
> would figure out what the actual speed was versus the reported
> speed. Probably only by calibrating TSC against an external source,
> but if the system is overclocked, what confidence level would I
> have that the external source is true ? It would be bad to penalize
> all in-spec users with excessive delays to support out-of-spec
> users.

Well you are right.  Anyway I am not sure if the system is stable enough
to compile a new kernel ;)

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
