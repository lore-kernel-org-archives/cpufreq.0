From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Cleanups for powernow-k8
Date: Wed, 14 Jan 2004 10:33:35 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040114093335.GO14031@poupinou.org>
References: <99F2150714F93F448942F9A9F112634C080EF392@txexmtae.amd.com>
	<20040113230605.GM14674@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040113230605.GM14674@redhat.com>
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
To: Dave Jones <davej@redhat.com>, paul.devriendt@amd.com, pavel@ucw.cz, cpufreq@www.linux.org.uk, linux@brodo.de, linux-kernel@vger.kernel.org

On Tue, Jan 13, 2004 at 11:06:05PM +0000, Dave Jones wrote:
> For minimal parsing of the ACPI P state tables, we shouldn't need the
> full-blown interpretor IMO.

Unfortunately, no.
Some laptop use a _INI method in order to 'write' to the _PST node..
In such laptop, the only parsing option will give you only crasp 
(see some post related to this issue on the ACPI dev list).

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
