From: Dave Jones <davej@redhat.com>
Subject: Re: PXA cpufreq support
Date: Wed, 21 Apr 2004 11:21:31 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040421102131.GK2465@redhat.com>
References: <Pine.LNX.4.58.0404192220000.2250@montezuma.fsmlabs.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0404192220000.2250@montezuma.fsmlabs.com>
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
To: Zwane Mwaikambo <zwane@arm.linux.org.uk>
Cc: Holger Schurig <h.schurig@mn-logistik.de>, CPU Freq ML <cpufreq@www.linux.org.uk>

On Tue, Apr 20, 2004 at 11:37:05PM -0400, Zwane Mwaikambo wrote:
 > Hi, i'd like to work towards merging the following PXA cpufreq driver.
 > 
 > Thanks
 > 
 > Status: WORKS
 > PXA CPU frequency change support
 > added mods from Stefan Eletzhofer and Lothar Weissmann

No complaints from me as long as Russell ACK's it.
I've zero clue about what goes on in ARM world.
If we wants to take it and merge through the ARM tree,
thats fine with me, as is pushing it through the cpufreq
tree in my next merge (which should happen in the next few days
btw for those interested -- the powernow-k7 acpi fallback stuff
seems to be doing the right thing for a few folks who've sent
me private feedback).

		Dave
