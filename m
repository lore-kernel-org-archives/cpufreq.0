From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] Add suspend routine to core
Date: Fri, 01 Apr 2005 09:07:43 +1000
Message-ID: <1112310463.31847.178.camel@gaston>
References: <1112143705.5353.74.camel@gaston>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1112143705.5353.74.camel@gaston>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

On Wed, 2005-03-30 at 10:48 +1000, Benjamin Herrenschmidt wrote:
> Hi !
> 
> In order to properly fix some issues with cpufreq vs. sleep on
> PowerBooks, I had to add a suspend callback to the pmac_cpufreq driver.
> I must force a switch to full speed before sleep and I switch back to
> previous speed on resume.
> 
> I also added a driver flag to disable the warnings in suspend/resume
> since it is expected in this case to have different speed (and I want it
> to fixup the jiffies properly).
>
> .../...

No feedback at all ? Without any feedback next week, I'll submit myself
to andrew ;)

Ben.
