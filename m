From: Pavel Machek <pavel@ucw.cz>
Subject: Re: powernow-k8 updates
Date: Fri, 26 Mar 2004 13:19:15 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040326121915.GA207@elf.ucw.cz>
References: <20040326120151.GA3102@elf.ucw.cz>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040326120151.GA3102@elf.ucw.cz>
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
To: linux@dominikbrodowski.de, paul.devriendt@amd.com, Cpufreq mailing list <cpufreq@www.linux.org.uk>

Hi!

> Few updates, enable ACPI, add common printing function, fix typo, move
> "pst out of sequence" where it belongs, fix formating in
> powernow-k8.h. I'm not quite sure what this is against, so this is
> "eyes only".

Its strange, ACPI code does not seem to mention batps at all, still
cpu goes to 800MHz when I unplug the cord... Perhaps it should at
least say something into the syslog?
								Pavel

-- 
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]
