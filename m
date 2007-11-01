From: Thomas Renninger <trenn@suse.de>
Subject: Re: CPU-Frequency limited to lowest available frequency
	while	under load
Date: Thu, 01 Nov 2007 19:31:18 +0100
Message-ID: <1193941879.4202.17.camel@noname>
References: <4727062E.9090806@cvmx.org>
	<1193837319.4590.466.camel@queen.suse.de> <472A15FF.5040504@cvmx.org>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <472A15FF.5040504@cvmx.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: Ferdinand =?ISO-8859-1?Q?H=FCbner?= <fh@cvmx.org>
Cc: cpufreq@lists.linux.org.uk

SGkgRmVyZGluYW5kLAoKSSBjdXQgZG93biB0aGUgbWFpbCBhIGJpdC4uLgpPbiBUaHUsIDIwMDct
MTEtMDEgYXQgMTk6MDcgKzAxMDAsIEZlcmRpbmFuZCBIw7xibmVyIHdyb3RlOgo+IFRob21hcyBS
ZW5uaW5nZXIgd3JvdGU6Cj4gCj4gPiBJdCBjYW4gYmU6Cj4gPiAgMSkgZnJlcXVlbmN5IGxpbWl0
ZWQgYnkgQklPUyB0aHJvdWdoIF9QUEMKPiA+ICAyKSBmcmVxdWVuY3kgcmVkdWNlZCBieSB0aGVy
bWFsIHBhc3NpdmUgbGltaXQKPiA+ICAzKSBzb21lIHJlYWxseSBvZGQgY3B1ZnJlcSBjb3JlIGJ1
Zwo+ID4gCj4gPj5Gcm9tIHRoZSBsYXN0IGJ1Z3Mgb2NjdXJyaW5nIGluIHRoaXMgYXJlYSBJIGV4
cGVjdCBpdCdzIDEuCgo+IEkgcmVwZWF0ZWQgdGhlIHRlc3QgYSBjb3VwbGUgb2YgdGltZXMgYW5k
IHRoZSBfUFBDIHZhbHVlcyBoYXZlIGFsd2F5cwo+IGJlZW4gMCBleGNlcHQgZm9yIHRoZSBsYXN0
IHRlc3QgSSBkaWQuIFRoZSB2YWx1ZSB3YXMgMyBpbiB0aGUgbGFzdCB0ZXN0Lgo+IERvZXMgdGhh
dCBtZWFuIHRoYXQgdGhlIEJJT1MgaXMgcGFydGlhbGx5IHJlc3BvbnNpYmxlPwpJZiB0aGUgdmFs
dWUgaXMgMywgdGhlIGhpZ2hlc3QgdGhyZWUgZnJlcXMgYXJlIG5vdCBhbGxvd2VkIGJ5IEJJT1Mu
ClRoaXMgbWF5IGJlIGludGVuZGVkLCBwcm9iYWJseSBub3QuCgpJTU8gYmVzdCBpcyB5b3Ugb3Bl
biBhIGJ1ZyBhdCBodHRwOi8vYnVnemlsbGEua2VybmVsLm9yZyB0byBjb2xsZWN0IGluZm8KYXQg
b25lIHBsYWNlLi4uLCBmb3Igbm93IEknZCBhc3NpZ24gaXQgdG8gdGhlIEFDUEkgY29tcG9uZW50
LgoKYWNwaWR1bXAgb3V0cHV0IHNob3VsZCBiZSBtb3N0IGltcG9ydGFudCBhdG0sIHBscyBhdHRh
Y2ggaXQgdGhlcmUgYW5kCnRha2UgbWUgaW50byBDQyBsaXN0LgoKSXMgaXQgcG9zc2libGUgZm9y
IHlvdSB0byByZXByb2R1Y2UgdGhpcyBlYXNpbHk/Ck1heWJlIHNvbWV0aGluZyB5b3Ugbm90aWNl
ZCBsaWtlOiBpdCBhbHdheXMgaGFwcGVucyBhZnRlciB4IG1pbnMgb3IKYWZ0ZXIgbG9hZGluZyBt
b2R1bGUgeS4uLgpZb3UgY291bGQgYWxzbyB0cnkgdG8gbm90IGxvYWQgb3RoZXIgQUNQSSBtb2R1
bGVzOiBiYXR0ZXJ5LCB0aGVybWFsLApidXR0b24sIGZhbiwgYWMuCk1heWJlIGl0IGRvZXMgbm90
IGhhcHBlbiB0aGVuIGFueW1vcmU/CgpEbyB5b3UgdXNlIGh3bW9uLCB0aGVybWFsIHNlbnNvciBt
b2R1bGVzPwoKICAgVGhvbWFzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KQ3B1ZnJlcSBtYWlsaW5nIGxpc3QKQ3B1ZnJlcUBsaXN0cy5saW51eC5vcmcu
dWsKaHR0cDovL2xpc3RzLmxpbnV4Lm9yZy51ay9tYWlsbWFuL2xpc3RpbmZvL2NwdWZyZXEK
