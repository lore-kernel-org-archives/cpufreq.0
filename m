From: Harald Milz <milz@seneca.muc.de>
Subject: Re: [ANNOUNCE] cpufrequtils-0.1 released
Date: Sat, 18 Dec 2004 22:24:52 +0100 (CET)
Message-ID: <20041218212452.DFAA849C33@nathan.muc.de>
References: <20041217225000.GA8245@dominikbrodowski.de>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Dominik Brodowski <linux@dominikbrodowski.de> wrote:
> cpufrequtils-0.1 is out and available at
> http://www.kernel.org/pub/linux/utils/kernel/cpufreq/cpufrequtils-0.1.tar.bz2

The message

3. FREQuencies must be passed in kHz = 1000 MHz = 1000000 GHz.

is nice, mathematically :-)) But it's confusing... What you probably mean
is

3. FREQuencies must be passed in kHz =^ MHz * 1,000 =^ GHz * 1,000,000

The README isn't of very much help either. 

-- 
"We demand rigidly defined areas of doubt and uncertainty!"
		-- Vroomfondel
