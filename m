From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: speedstep and deep sleep on celeron-M
Date: Mon, 20 Sep 2004 19:07:09 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040920170709.GB7952@dominikbrodowski.de>
References: <414BF01D.4000905@altern.org>
	<20040918215839.GA7717@dominikbrodowski.de>
	<20040920104730.GK16132@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040920104730.GK16132@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

On Mon, Sep 20, 2004 at 12:47:30PM +0200, Bruno Ducrot wrote:
> On Sat, Sep 18, 2004 at 11:58:39PM +0200, Dominik Brodowski wrote:
> > Hi,
> > 
> > Deep Sleep might be supported (depending on the BIOS in your notebook) by
> > the ACPI processor subsystem. It's a form of "idling" which is enabled when
> > the CPU has nothing to do, and may be C-State 3. For more information on
> > that, check the current ACPI processor information at http://acpi.sf.net;
> > also bug #1958 at bugzilla.kernel.org may be of interest as it can enable
> > more C-States. However, it depends on the BIOS which CPU Power State (Deep
> > Sleep is one of them) is enabled as what C-State. It has nothing to do with
> > CPUfreq, though.
> 
> 
> Actually, deep sleep state is C3, whereas deeper sleep state is supposed
> to be C4 (though it's possible to enter deeper sleep state instead of
> deep sleep state IIRC).

Excactly. And Deep Sleep is nothing new, Deeper Sleep is.

	Dominik
