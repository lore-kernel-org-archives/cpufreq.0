From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: [ACPI] _PDC method in DSDT
Date: 23 Jun 2003 10:12:16 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1056388336.15250.62.camel@ixodes.goop.org>
References: <F760B14C9561B941B89469F59BA3A84725A303@orsmsx401.jf.intel.com>
	 <20030623133834.GA2330@brodo.de>  <20030623161136.GG19556@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030623161136.GG19556@poupinou.org>
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
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: Dominik Brodowski <linux@brodo.de>, Andrew Grover <andrew.grover@intel.com>, David Moore <dcm@acm.org>, "Adachi, Kenichi" <adachi@rd.scei.sony.co.jp>, acpi-devel@lists.sourceforge.net, cpufreq list <cpufreq@www.linux.org.uk>

On Mon, 2003-06-23 at 09:11, Ducrot Bruno wrote:
> Yes.  It can be added.  But do we want to add it?  That's the real
> question.

Well, the current scheme only works because there's a small number of
easily identifiable Enhanced SpeedStep-capable processors which happen
to use the same encoding for the PERF_CTL register.  It could get more
complicated in future, and falling back to a table from ACPI may well be
the appropriate solution for many people - though I would like to
maintain the tables in speedstep-centrino so that it isn't dependent on
ACPI.

	J
