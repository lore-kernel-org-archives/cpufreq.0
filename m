From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH] cpufreq: allow ondemand governor as default
Date: Mon, 7 Mar 2005 18:41:50 +0100
Message-ID: <20050307174150.GC31985@poupinou.org>
References: <20050304011359.GA32684@aquarid.physics.uwo.ca>
	<20050306170625.GA2034@isilmar.linta.de>
	<20050306215106.GA25034@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050306215106.GA25034@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: Rob Weryk <rjweryk@uwo.ca>, cpufreq@ZenII.linux.org.uk, Dominik Brodowski <linux@dominikbrodowski.net>

On Sun, Mar 06, 2005 at 04:51:06PM -0500, Dave Jones wrote:
> On Sun, Mar 06, 2005 at 06:06:25PM +0100, Dominik Brodowski wrote:
> 
>  > This is not possible yet -- unfortunately. If you set ondemand to be
>  > "default" but it fails at initialization (it does so for several drivers!),
>  > cpufreq enters an undefined state
> 
> I knew there was a reason for declining this, but couldn't recall
> what it was (hence I sent Rob to the list when he sent me the patch).

It refuse to load when latency for a state transition is too high (or unknown),
and if there is only ondemand as governor selected then kernel will likely fail at
boot time.  It has been stated that its up to the low level drivers to
provide good information about latencies and therefore it is not
acceptable to accept to load ondemand if latency is unknown (but I don't
remember if its acceptable if latency is too high sorry ;)

And I dont remember what happens when the driver dont use the frequency
table helpers (geode) or is already capable for automaticaly
state switching (longrun).

> This has come up about 4-5 times now in the last month or two.
> Maybe its worth adding a comment to the Kconfig to prevent a 6th time :-)

Sure.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
