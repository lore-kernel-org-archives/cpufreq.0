From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Dealing with faulty BIOS table
Date: Wed, 21 Jan 2004 11:32:54 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040121103254.GV25416@poupinou.org>
References: <1074482108.7978.232.camel@localhost.localdomain>
	<20040119093520.GC11081@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040119093520.GC11081@dominikbrodowski.de>
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
To: Drew Varner <drew.varner@redops.org>, cpufreq@www.linux.org.uk

On Mon, Jan 19, 2004 at 10:35:20AM +0100, Dominik Brodowski wrote:
> Hi,
> 
> > Is there a blueprint for how to deal with broken PST tables given their
> > prevalence? I know that the ideal solution is for vendors to ship
> > machines with the correct data in the BIOS.
> 
> There's some discussion of the next-to-ideal solution to use the information
> in the ACPI tables instead of the PST tables when these are broken. Window$
> uses the info in the ACPI tables, so we should be able to solve many issues
> this way.


FYI: I'm planing to introduce a kind of 'merge' of the two infos, also
there may be soon a way to override the table via sysfs if really needed.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
