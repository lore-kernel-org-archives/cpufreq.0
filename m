From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: SpeedStep New Driver for Pentium III (-M) using SMI interface
Date: Thu, 4 Sep 2003 17:34:52 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030904153452.GK4401@poupinou.org>
References: <871xuzbycu.wl%miura@da-cha.org>
	<20030904124230.GH4401@poupinou.org>
	<87ptigsnle.wl%miura@da-cha.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <87ptigsnle.wl%miura@da-cha.org>
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
To: Hiroshi Miura <miura@da-cha.org>
Cc: cpufreq@www.linux.org.uk

On Thu, Sep 04, 2003 at 10:13:49PM +0900, Hiroshi Miura wrote:
> 
> Ok, kernel 2.4 has no hibernation staff,
> then not so big problem about it.
> 
> I didn't test it with apm, so I don't know 
> what happens. to work-around, user can unload/load the module. 

Most systems with a piii and piix4 are somehow 'old' and work
like a charm with apm, so I have to fix it (but i need to
update core at first).

S1 may work also, and is supported by acpi, I guest it should
be ok, but who knows.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
