From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: kernel/cpufreq.c, drivers/cpufreq/ or kernel/power/cpufreq/ ?
Date: Thu, 21 Aug 2003 19:06:05 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030821170605.GB19292@poupinou.org>
References: <20030821071832.GA1973@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030821071832.GA1973@brodo.de>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@brodo.de>
Cc: davej@suse.de, mochel@osdl.org, cpufreq@www.linux.org.uk

On Thu, Aug 21, 2003 at 09:18:32AM +0200, Dominik Brodowski wrote:
> Right now cross-architecture cpufreq files are in
> drivers/cpufreq/ 	and the cpufreq core is in
> kernel/cpufreq.c
> 
> IMHO these files should move to one destination, and I'd favour
> drivers/cpufreq/ for that. Or is kernel/power/cpufreq/ a better location for
> that?

I can't tell for sure (and Pat have certainly more knowledge than me),
but kernel/power is more appropriate for system power management,
not for processor power management.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
